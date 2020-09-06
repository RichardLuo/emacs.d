(require-package 'yasnippet)
(require 'yasnippet)
;; make Ctrl-c k the only trigger key for yas
;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)
;; (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/"                 ;; personal snippets
        ))

(yas-global-mode 1)

(require 'warnings)
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))

(provide 'init-yasnippet)



