
(use-package hydra
  :ensure t)


(defhydra hydra-resize-window (global-map "C-x w")
  "resize-window"
  ("{" shrink-window-horizontally "shrink horizontally")
  ("}" enlarge-window-horizontally "enlarge horizontally")
  ("^" enlarge-window "enlarge vertically")
  ("-" shrink-window "shrink vertically")
  ("q" nil "quit" :color blue))

(global-set-key (kbd "C-x w") 'hydra-resize-window/body)

(provide 'init-hydra)
