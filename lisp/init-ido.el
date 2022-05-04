(if (version< emacs-version "28.1")
    (progn
      (progn
        ;; make buffer switch command do suggestions, also for find-file command
        (require 'ido)
        (ido-mode 1)
        ;; show choices vertically
        (setf (nth 2 ido-decorations) "\n")
        ;; show any name that has the chars you typed
        (setq ido-enable-flex-matching t)
        ;; use current pane for newly opened file
        (setq ido-default-file-method 'selected-window)
        ;; use current pane for newly switched buffer
        (setq ido-default-buffer-method 'selected-window)
        )
      (progn
        ;; minibuffer enhanced completion icomplete
        (require 'icomplete)
        (icomplete-mode 1)
        ;; show choices vertically
        (setq icomplete-separator "\n")
        (setq icomplete-hide-common-prefix nil)
        (setq icomplete-in-buffer t)
        (define-key icomplete-minibuffer-map (kbd "<right>") 'icomplete-forward-completions)
        (define-key icomplete-minibuffer-map (kbd "<left>") 'icomplete-backward-completions)))
  (fido-vertical-mode 1))

(provide 'init-ido)
