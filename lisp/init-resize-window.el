(use-package hydra
  :ensure t)

(use-package golden-ratio
  :ensure t
  :init
  (golden-ratio-mode 1))

(defvar my-golden-ratio-state nil
  "Remember whether golden-ratio-mode was on before resizing.")

(defhydra hydra-resize-window (:pre (progn
                                      (setq my-golden-ratio-state golden-ratio-mode)
                                      (when my-golden-ratio-state
                                        (golden-ratio-mode -1)))
                           :post (progn
                                   (when my-golden-ratio-state
                                     (golden-ratio-mode 1))))
  "resize-window"
  ("h" (lambda () (interactive) (shrink-window-horizontally 4))
       "shrink horizontally")
  ("l" (lambda () (interactive) (enlarge-window-horizontally 4))
       "enlarge horizontally")
  ("j" (lambda () (interactive) (enlarge-window 4))
       "enlarge vertically")
  ("k" (lambda () (interactive) (shrink-window 4))
       "shrink vertically")
  ("q" nil "quit" :color blue))

(global-set-key (kbd "C-x w") 'hydra-resize-window/body)

;; (defhydra hydra-resize-window (global-map "C-x w")
;;   "resize-window"
;;   ("h" (lambda () (interactive) (shrink-window-horizontally 4))
;;        "shrink horizontally")
;;   ("l" (lambda () (interactive) (enlarge-window-horizontally 4))
;;        "enlarge horizontally")
;;   ("j" (lambda () (interactive) (enlarge-window 4))
;;        "enlarge vertically")
;;   ("k" (lambda () (interactive) (shrink-window 4))
;;        "shrink vertically")
;;   ("q" nil "quit" :color blue))
;; (defhydra hydra-resize-window (global-map "C-x w")
;;   "resize-window"
;;   ("{" shrink-window-horizontally "shrink horizontally")
;;   ("}" enlarge-window-horizontally "enlarge horizontally")
;;   ("^" enlarge-window "enlarge vertically")
;;   ("-" shrink-window "shrink vertically")
;;   ("q" nil "quit" :color blue))
;; (global-set-key (kbd "C-x w") 'hydra-resize-window/body)

(provide 'init-resize-window)
