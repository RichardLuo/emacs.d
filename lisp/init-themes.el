(require-package 'color-theme-modern)

;; (load-theme 'deeper-blue t t)
;; (enable-theme 'deeper-blue)

;; load your favorite theme
(load-theme 'blue-mood t t)
(enable-theme 'blue-mood)

(setq frame-resize-pixelwise t)
(set-frame-position (selected-frame) 50 0)
(set-frame-size (selected-frame) 1300 820 t)

(provide 'init-themes)
