(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "M-n") nil)
  (define-key markdown-mode-map (kbd "M-p") nil))

(provide 'init-markdown)
