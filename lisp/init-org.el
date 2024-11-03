;; Org-mode基础配置
(use-package org
  :ensure t
  :config
  ;; 设置默认Org文件目录
  (setq org-directory "~/org/")

  (setq org-agenda-files '("~/org"))

  (setq org-log-done 'note)  ;; 当任务完成时，提示输入注释并记录时间


  ;; 设置Org目录和默认Org文件
  (setq org-directory (list "~/org" "~/obsidian-techspec/org"))
  (setq org-default-notes-file (expand-file-name "notes.org" (car org-directory)))

  ;; Org-indent模式，用于美化文档结构
  (setq org-startup-indented t)

  ;; 配置TODO关键词的外观
  (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "|" "DONE" "ARCHIVED")))

  ;; 配置TODO关键词的颜色
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "red" :weight bold))
          ("IN-PROGRESS" . (:foreground "blue" :weight bold))
          ("DONE" . (:foreground "forest green" :weight bold))
          ("ARCHIVED" . (:foreground "dim gray" :weight bold))))

  ;; 配置标题的字体大小
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
   )

  ;; 配置代码块的语法高亮
  (setq org-src-fontify-natively t)

  ;; 配置Org-agenda快捷键
  (define-key org-mode-map (kbd "C-c a") 'org-agenda)

  ;; 配置Org-capture快捷键（仅限org-mode下）
  (define-key org-mode-map (kbd "C-c c") 'org-capture)

  ;; 启用对代码块的语言支持
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (shell . t)  ;; 启用Bash支持
     (C . t)      ;; 启用C语言支持
     ;; 其他语言支持可以根据需要添加
     ))

  ;; 确保在执行代码块前进行确认
  (setq org-confirm-babel-evaluate nil)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/tasks.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("n" "Note" entry (file "~/org/notes.org")
         "* %U %?\n  %i\n  %a")
        ("N" "New Org Entry" plain
         (file (lambda () (buffer-file-name)))
         "#+TITLE: %^{Title}\n#+AUTHOR: York.Lee\n#+EMAIL: york.lee@gmail.com\n#+DATE: %U\n#+DESCRIPTION: %^{Description}\n\n"
         :empty-lines 0)
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %U %?\n  %i\n  %a")
        ("b" "Bookmark" entry (file "~/org/bookmarks.org")
         "* %?  \n %u\n  %a\n[[bookmark:%s][My Bookmark]]")))
  )

;; ;; Org-bullets，用漂亮的符号替换标准的Org模式的列表符号
;; (use-package org-bullets
;;   :ensure t
;;   :after org
;;   :hook (org-mode . org-bullets-mode)
;;   :custom
;;   (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package ox-pandoc
  :ensure t  ;; 确保ox-pandoc插件已安装
  :after org ;; 确保在org-mode加载之后再加载ox-pandoc
  :config
  (require 'ox-pandoc)
  ;; default options for all output formats
  (setq org-pandoc-options '((standalone . t)))
  (setq org-pandoc-options-for-markdown '((standalone . t)))
  (setq org-pandoc-options-for-markdown_github '((standalone . t)))
  )

(eval-after-load 'ox
  '(add-to-list 'org-export-backends 'pandoc))


(use-package org-cliplink
  :ensure t
  :commands (org-cliplink-capture)
  :config
  (setq org-cliplink-default-description-style 'title)  ; 使用页面标题作为描述
)

(defun get-right-of-cursor ()
  (interactive)
  (let* ((start-pos (point))
         (end-pos (min (line-end-position) (+ start-pos 60)))  ; 计算最多60个字符的位置，不超过行末
         (right-string (buffer-substring-no-properties start-pos end-pos)))  ; 获取右侧字符串
    (message "Right string: %s" right-string)))

(defun org-gen-file-link-line-no ()
  "Insert a link to the current file and line number in org-mode format into the clipboard, with a generated description."
  (interactive)
  (let* ((line-number (line-number-at-pos))
         (file-name (file-name-nondirectory (buffer-file-name)))
         (start-pos (point))
         (end-pos (min (line-end-position) (+ start-pos 60)))  ; 计算最多60个字符的位置，不超过行末
         (description (buffer-substring-no-properties start-pos end-pos))  ; 获取右侧字符串作为描述
         (link (format "[[file:%s::%d][%s]]" file-name line-number description)))  ; 生成链接
    (kill-new link)
    (message "Link copied to clipboard: %s" link)
    (let ((user-description (read-string "Edit description: " description)))
      (kill-new (format "[[file:%s::%d][%s]]" file-name line-number user-description)))))


(defun org-gen-abs-file-link-line-no ()
  "Insert a link to the current file (absolute path) and line number in org-mode format into the clipboard, with a generated description."
  (interactive)
  (let* ((line-number (line-number-at-pos))
         (file-name (expand-file-name (buffer-file-name)))  ; 获取绝对路径
         (start-pos (point))
         (end-pos (min (line-end-position) (+ start-pos 60)))
         (description (buffer-substring-no-properties start-pos end-pos))
         (link (format "[[file:%s::%d][%s]]" file-name line-number description)))
    (kill-new link)
    (message "Link copied to clipboard: %s" link)
    (let ((user-description (read-string "Edit description: " description)))
      (kill-new (format "[[file:%s::%d][%s]]" file-name line-number user-description)))))

(use-package org-appear
  :ensure t
  :after org
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-hide-emphasis-markers t       ;; 确保隐藏加粗、斜体等符号
        org-appear-autoemphasis t         ;; 启用强调符号的自动显示
        org-appear-autolinks t            ;; 启用链接的自动显示
        org-appear-autosubmarkers t       ;; 启用上标和下标符号的自动显示
        org-appear-autoentities t         ;; 启用 Org entities 的自动显示
        org-appear-autokeywords t         ;; 启用关键字的自动显示
        org-appear-inside-latex t         ;; 启用 LaTeX 片段符号的自动显示
        org-appear-delay 0.5              ;; 设置延迟时间为 0.5 秒
        org-appear-trigger 'manual))      ;; 设置手动触发


(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  :config
  ;; 如果使用 org-superstar，可以关闭 org-modern 的标题符号设置
  (setq org-modern-star nil)
  ;; 保留其他 org-modern 的美化功能
  (setq org-modern-list nil)  ;; 如果想让列表符号也用 org-superstar，禁用 org-modern 的列表符号
  )

(use-package org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "◆" "▶")

        org-superstar-item-bullet-alist '((?+ . ?●)   ;; 大黑点
                                          (?* . ?◆)
                                          (?- . ?■))

        ;; org-superstar-item-bullet-alist '((?+ . ?•)   ;; 小圆点
        ;;                                   (?* . ?▪)   ;; 实心小方块
        ;;                                   (?- . ?‣))

        ))


;; (use-package visual-fill-column
;;   :ensure t
;;   :hook (org-mode . my/org-visual-fill)
;;   :config
;;   (setq visual-fill-column-width 80    ;; 设置文本宽度
;;         visual-fill-column-center-text t))  ;; 居中显示
;; (defun my/org-visual-fill ()
;;   "启用 org-mode 中的 visual-line-mode 和 visual-fill-column-mode。"
;;   (visual-line-mode 1)  ;; 自动换行
;;   (visual-fill-column-mode 1))  ;; 控制宽度和居中

;; (defun my/org-visual-fill ()
;;   "启用 org-mode 中的 visual-line-mode 和 visual-fill-column-mode。"
;;   (interactive)  ;; 让函数可以被交互式调用
;;   (visual-line-mode 1)  ;; 启用自动换行
;;   (visual-fill-column-mode 1))  ;; 启用宽度限制和居中显示
;; ;; 配置 visual-fill-column
;; (use-package visual-fill-column
;;   :ensure t
;;   :after org  ;; 确保在 org-mode 加载之后再加载 visual-fill-column
;;   :hook (org-mode . my/org-visual-fill)
;;   :config
;;   (setq visual-fill-column-width 130    ;; 设置文本宽度
;;         visual-fill-column-center-text t))  ;; 居中显示
;; ;; (setq-default fill-column nil)
;; (define-key org-mode-map (kbd "C-c C-x v") 'my/org-visual-fill)

(provide 'init-org)
