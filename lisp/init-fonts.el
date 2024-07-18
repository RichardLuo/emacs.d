;; 使用 use-package 安装和配置 default-text-scale
(use-package default-text-scale
  :ensure t
  :bind (("C-M-=" . default-text-scale-increase)
         ("C-M--" . default-text-scale-decrease)))

;; 如果需要特定的字体设置，可以取消注释并修改以下部分
;; (setq window-system-default-frame-alist
;;       '((x (font . "文泉驿等宽微米黑 11")) ;; 如果在 X 显示器上创建帧
;;         (nil))) ;; 如果在终端

;; 设置默认字体
;; (set-frame-font "Monaco:size=15")
;; (set-face-attribute 'default nil :font "Monaco-15")
;; (setq default-frame-alist nil)

;; 加载主题
;; (use-package sanityinc-tomorrow-bright-theme
;;   :ensure t
;;   :config
;;   (load-theme 'sanityinc-tomorrow-bright t))

(provide 'init-fonts)

