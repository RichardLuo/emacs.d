;; (add-to-list 'load-path (expand-file-name "lisp/editing-utils" user-emacs-directory))

;; 使用 use-package 安装和配置 diminish
(use-package diminish
  :ensure t)

;; 默认设置
(setq-default
 blink-cursor-delay 0.5
 blink-cursor-interval 0.4
 buffers-menu-max-size 20
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 delete-selection-mode t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position t
 scroll-step 1
 scroll-margin 3
 scroll-conservatively 10000
 set-mark-command-repeat-pop t
 show-trailing-whitespace nil
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)

(set-scroll-bar-mode nil)
(tool-bar-mode -1)

;; 在代码行的末尾输入Return则自动换行
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

;; 在代码行的中间执行自动换行，而不会导致断行
(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)

;; 更改 yes-or-no 提示为 y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示时间
(display-time-mode t)
(setq display-time-24hr-format t)

;; 启用全局行号显示
(global-display-line-numbers-mode t)

;; 启用 visual line mode
(global-visual-line-mode t)
(diminish 'visual-line-mode)

;; 使用 page-break-lines 处理 ^L 分页符号
(use-package page-break-lines
  :ensure t
  :config
  (global-page-break-lines-mode)
  (diminish 'page-break-lines-mode))

;; 启用编译快捷方式
(use-package compile
  :config
  (setq compilation-scroll-output t))

(provide 'init-editing-utils)

;;; init-editing-utils.el ends here
