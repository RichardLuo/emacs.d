(use-package clang-format
  :ensure t)

(defun clang-format-defun ()
  "Format the current function using clang-format."
  (interactive)
  (save-excursion
    (mark-defun)
    (clang-format-region (region-beginning) (region-end))))

(with-eval-after-load 'cc-mode
  (define-key c-mode-base-map (kbd "<tab>") 'clang-format-region)
  (define-key c-mode-map (kbd "C-c C-q") 'clang-format-defun)
  (define-key c++-mode-map (kbd "C-c C-q") 'clang-format-defun))

(provide 'init-clangfmt)
