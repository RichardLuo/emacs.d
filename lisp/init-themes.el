;; (require-package 'color-theme-modern)
;; (load-theme 'blue-mood t t)
;; (enable-theme 'blue-mood)
;; (setq frame-resize-pixelwise t)
;; (set-frame-position (selected-frame) 50 0)
;; (set-frame-size (selected-frame) 1300 820 t)

(when (eq system-type 'darwin) ;; mac specific settings
  (set-frame-font "Monaco-17")
  (set-face-attribute 'default nil :font "Monaco-17")
  (setq default-frame-alist nil)
  (use-package nord-theme
    :init (load-theme 'nord t))
  )

(when (eq system-type 'gnu/linux) ;; mac specific settings
  (set-frame-font "Monaco-25")
  (set-face-attribute 'default nil :font "Monaco-25")
  (setq default-frame-alist nil)
  (use-package doom-themes
    :init (load-theme 'doom-palenight t)))


;; (add-hook 'after-make-frame-functions
;;           (lambda ()
;;             ;; we want some font only in GUI Emacs
;;             (when (display-graphics-p)
;;               (set-frame-font "DejaVu Sans Mono 28"))))

(provide 'init-themes)
