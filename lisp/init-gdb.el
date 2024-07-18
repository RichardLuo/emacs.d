;; (global-set-key [M-left] 'windmove-left)
;; (global-set-key [M-right] 'windmove-right)
;; (global-set-key [M-up] 'windmove-up)
;; (global-set-key [M-down] 'windmove-down)

;; (global-set-key [f5] 'gud-run)
;; (global-set-key [S-f5] 'gud-cont)
;; (global-set-key [f6] 'gud-jump)
;; (global-set-key [S-f6] 'gud-print)
;; (global-set-key [f7] 'gud-step)
;; (global-set-key [f8] 'gud-next)
;; (global-set-key [S-f7] 'gud-stepi)
;; (global-set-key [S-f8] 'gud-nexti)
;; (global-set-key [f9] 'gud-break)
;; (global-set-key [S-f9] 'gud-remove)
;; (global-set-key [f10] 'gud-until)
;; (global-set-key [S-f10] 'gud-finish)
;; (global-set-key [f4] 'gud-up)
;; (global-set-key [S-f4] 'gud-down)

;; (require 'xt-mouse)
;; (xterm-mouse-mode)
;; (require 'mouse)
;; (xterm-mouse-mode t)
;; (defun track-mouse (e))

(use-package gdb-mi
  :ensure nil
  :commands (gdb)
  :config
  (setq gdb-many-windows t)  ;; 启用多窗口布局
  (setq gdb-show-main t)     ;; 显示主窗口
  
  ;; 自定义键绑定或其他配置
  (defun my-setup-gdb-keys ()
    (define-key gdb-mode-map (kbd "M-o") 'other-window))
  
  ;; 在启用 GDB 时调用自定义配置
  (add-hook 'gdb-mode-hook 'my-setup-gdb-keys))

(provide 'init-gdb)
