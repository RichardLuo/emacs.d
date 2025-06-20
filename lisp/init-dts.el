;; 使用 use-package 安装和配置 dts-mode
(use-package dts-mode
  :ensure t
  :mode ("\\.dts\\'" "\\.dtsi\\'" "\\.overlay\\'")
  :hook (dts-mode . (lambda ()
                      (setq indent-tabs-mode nil)  ; 使用空格而不是制表符
                      (setq tab-width 4))))       ; 设置制表符宽度为 4 （仅对视觉效果）

(provide 'init-dts)

;;; init-dts.el ends here
