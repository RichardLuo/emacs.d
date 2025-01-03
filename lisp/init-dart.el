(use-package lsp-dart
  :ensure t
  :hook (dart-mode . lsp)
  :config
  (let ((sdk-path (expand-file-name "fvm/versions/stable/" (getenv "HOME"))))
    (setq lsp-dart-sdk-dir sdk-path)
    (setq lsp-dart-flutter-sdk-dir sdk-path)))

(defun my-dart-mode-setup ()
  "Treat underscore as part of a word in dart-mode."
  (modify-syntax-entry ?_ "w" dart-mode-syntax-table))

(add-hook 'dart-mode-hook 'my-dart-mode-setup)

(provide 'init-dart)
