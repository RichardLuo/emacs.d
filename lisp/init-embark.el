;; Embark core setup
(use-package embark
  :init
  (setq prefix-help-command #'embark-prefix-help-command
        embark-verbose-indicator t
        embark-action-indicator
        (lambda (&optional key target)
          (when (and key target)
            (message "Embark: %s on %s" key target)))))


(use-package embark-consult
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode)
  :config
  ;; 强制设置 preview 函数，确保移动时能跳转
  (add-hook 'embark-collect-mode-hook
            (lambda ()
              (setq-local consult--preview-function
                          #'consult--lookup-candidate-preview))))

(define-key global-map (kbd "C-.") #'embark-act)

(with-eval-after-load 'embark
  (define-key minibuffer-local-map (kbd "C-c C-o") #'embark-collect))


;; Enable recursive minibuffers so embark-bindings can be used in minibuffer
(setq enable-recursive-minibuffers t)

(provide 'init-embark)
;;; init-embark.el ends here
