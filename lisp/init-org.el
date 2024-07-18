;; 确保你有一个Emacs版本至少为26.1
;; 将这段代码添加到你的init.el文件中，或者如果你使用的是Doom Emacs或Spacemacs，按照相应的方式添加到配置中

;; Org-mode基础配置
(use-package org
  :ensure t
  :config
  ;; 设置默认Org文件目录
  (setq org-directory "~/org/")
  ;; 设置默认Org文件
  (setq org-default-notes-file (concat org-directory "/notes.org"))

  ;; 启用Org-indent模式，美化文档结构
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
  (global-set-key (kbd "C-c a") 'org-agenda)

  ;; 更多个人化设置可以在这里添加
  )

;; Org-bullets，用漂亮的符号替换标准的Org模式的列表符号
(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; 启用Org-mode和相关包
(require 'org)
(require 'org-bullets)

;; 提醒：确保你已经安装了use-package和org-bullets
;; 你可能需要在配置中添加以下行来安装use-package:
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

(provide 'init-org)
