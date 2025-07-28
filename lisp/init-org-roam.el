;; Org-roam 基础配置
(use-package org-roam
  :ensure t
  :init
  ;; 设置你的笔记存放目录
  (setq org-roam-directory (expand-file-name "/Volumes/LittleMole/macbook-richard/obsidian-techspec/org"))
  :custom
  ;; 推荐：如果引用标题没 ID 会自动生成
  (org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
  :bind (("C-c n f" . org-roam-node-find)    ;; 搜索/新建笔记
         ("C-c n i" . org-roam-node-insert)  ;; 在当前笔记插入链接
         ("C-c n l" . org-roam-buffer-toggle) ;; 显示反向链接侧栏
         ("C-c n c" . org-roam-capture))     ;; 快速新建笔记
  :config
  (org-roam-db-autosync-mode)) ;; 自动同步数据库

(defun my/org-add-ids-to-current-file ()
  "给当前 Org 文件里所有 headline（section）自动生成 ID。"
  (interactive)
  (when (eq major-mode 'org-mode)
    (org-map-entries
     (lambda ()
       (unless (org-entry-get (point) "ID")
         (org-id-get-create)))
     nil 'file)
    (save-buffer)
    (message "✅ 已为 %s 的所有 headline 生成 ID" (buffer-name))))


(defun my/org-roam-list-backlinks-to-current-file ()
  "列出当前 Org 文件的所有 headline 节点被哪些节点引用（彻底修正 LIKE 用法）。"
  (interactive)
  (require 'org-roam)
  (message "📂 [DEBUG] 当前使用数据库: %s" org-roam-db-location)
  (org-roam-db-sync)
  (let* ((current-file (expand-file-name (buffer-file-name)))
         (current-filename (file-name-nondirectory current-file))
         ;; ✅ 拼接成 EmacSQL 支持的 %xxx.org 模式
         (like-pattern (concat "%" current-filename)))
    (message "🔍 [DEBUG] current-filename = %s" current-filename)
    (message "🔍 [DEBUG] LIKE 模式 = %s" like-pattern)

    ;; 查所有 nodes.file 方便验证
    (let ((files (org-roam-db-query [:select [file] :from nodes])))
      (message "📄 [DEBUG] 数据库 nodes.file 数量 = %d" (length files))
      (dolist (f files)
        (message "📄 [DEBUG] nodes.file = %s" (car f))))

    ;; ✅ 关键：这里使用 EmacSQL 支持的 (like file $s)
    (let* ((target-nodes
            (org-roam-db-query
             [:select [id title file]
              :from nodes
              :where (like file $s)]
             like-pattern)))
      (message "🔍 [DEBUG] LIKE 匹配结果 = %S" target-nodes)
      (let ((target-ids (mapcar #'car target-nodes)))
        (if (null target-ids)
            (message "❌ 没有匹配到任何节点")
          (message "✅ 匹配到 %d 个节点: %S" (length target-ids) target-ids)
          ;; 查引用
          (let (results)
            (dolist (tid target-ids)
              (let ((backlinks
                     (org-roam-db-query
                      [:select [links:source links:dest links:type nodes:file nodes:title]
                       :from links
                       :left-join nodes
                       :on (= links:source nodes:id)
                       :where (= links:dest $s)]
                      tid)))
                (setq results (append results backlinks))))
            (if (null results)
                (message "✅ 没有任何引用")
              (with-output-to-temp-buffer "*Org-roam backlinks*"
                (princ (format "📎 当前文件 %s 被以下节点引用：\n\n" current-filename))
                (dolist (row results)
                  (let ((src-title (nth 4 row))
                        (src-file  (nth 3 row))
                        (dest-id   (nth 1 row)))
                    (princ (format "👉 %s (%s)\n ↳ dest=%s\n"
                                   (or src-title "[无标题]")
                                   (file-name-nondirectory src-file)
                                   dest-id)))))
              (message "📎 引用已输出"))))))))


(defun my/org-roam-db-dump ()
  "Dump all tables (nodes, links, files, tags) from org-roam.db."
  (interactive)
  (require 'org-roam)
  ;; 确保数据库路径正确 (跟 init.el 同目录)
  (let ((org-roam-db-location
         (expand-file-name "org-roam.db"
                           (file-name-directory user-init-file))))
    (org-roam-db-sync)
    (with-output-to-temp-buffer "*Org-roam DB Dump*"
      (princ (format "📂 当前数据库文件: %s\n\n" org-roam-db-location))

      ;; dump nodes
      (princ "==== [nodes] 所有节点 ====\n")
      (dolist (row (org-roam-db-query
                    [:select [id file title level pos] :from nodes]))
        (princ (format "ID=%s\n  file=%s\n  title=%s\n  level=%s pos=%s\n\n"
                       (nth 0 row) (nth 1 row) (nth 2 row) (nth 3 row) (nth 4 row))))

      ;; dump links
      (princ "==== [links] 所有链接 ====\n")
      (dolist (row (org-roam-db-query
                    [:select [source dest type pos] :from links]))
        (princ (format "source=%s\n  dest=%s\n  type=%s pos=%s\n\n"
                       (nth 0 row) (nth 1 row) (nth 2 row) (nth 3 row))))

      ;; dump files
      (princ "==== [files] 所有文件 ====\n")
      (dolist (row (org-roam-db-query
                    [:select [file title hash] :from files]))
        (princ (format "file=%s\n  title=%s\n  hash=%s\n\n"
                       (nth 0 row) (nth 1 row) (nth 2 row))))

      ;; dump tags (v2 用 node_id)
      (princ "==== [tags] 所有标签 ====\n")
      (dolist (row (org-roam-db-query
                    [:select [node_id tag] :from tags]))
        (princ (format "node_id=%s tag=%s\n" (nth 0 row) (nth 1 row))))

      (message "✅ Org-roam 数据库已导出到 *Org-roam DB Dump* buffer"))))



(provide 'init-org-roam)
