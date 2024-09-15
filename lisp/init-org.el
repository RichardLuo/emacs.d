;; 确保你有一个Emacs版本至少为26.1
;; 将这段代码添加到你的init.el文件中，或者如果你使用的是Doom Emacs或Spacemacs，按照相应的方式添加到配置中

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
        '(("n" "New Org Entry" plain
           (file (lambda () (buffer-file-name)))
           "#+TITLE: %^{Title}\n#+AUTHOR: York.Lee\n#+EMAIL: york.lee@gmail.com\n#+DATE: %U\n#+DESCRIPTION: %^{Description}\n\n"
           :empty-lines 0))) ;; 确保没有多余的空行
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

;; (setq-default line-spacing 0.2)  ;; 调整行间距
;; (setq-default default-text-properties '(line-height 1.0))  ;; 调整字符间距

(provide 'init-org)
