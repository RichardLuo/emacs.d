(require-package 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

;; (setq window-system-default-frame-alist
;;       '((x (font . "文泉驿等宽微米黑 11")) ;; if frame created on x display
;;         (nil))) ;; if on term


;; (set-frame-font "Monaco:size=15")
;; (set-face-attribute 'default nil :font "Monaco-15")
;; (setq default-frame-alist nil)

;; (load-theme 'sanityinc-tomorrow-bright t)


(provide 'init-fonts)
