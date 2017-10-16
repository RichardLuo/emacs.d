(add-hook 'c++-mode-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f5)] 'compile)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  ;; (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(control c) (control d)] 'c-down-conditional-with-else)
  )

(modify-syntax-entry ?_ "w" c-mode-syntax-table)
(modify-syntax-entry ?_ "w" c++-mode-syntax-table)

;; (define-key global-map (kbd "s-x") 'semantic-ia-complete-symbol-menu)
;; (setq c-macro-prompt-flag t)

;;================================================================
;;set c & c++ style as stroustrup style
;; (add-hook 'c++-mode-hook
;; 		  '(lambda()
;; 			 (c-set-style "stroustrup")))
;; (add-hook 'c-mode-hook
;; 		  '(lambda ()
;; 			 (c-set-style "stroustrup")))

;; (add-hook 'java-mode-hook
;; 		  '(lambda ()
;; 			 (c-set-style "stroustrup")))

(load "google-c-style.el" nil t t)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(provide 'init-ccmode)
