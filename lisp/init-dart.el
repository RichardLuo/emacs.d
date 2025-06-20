;; (use-package lsp-dart
;;   :ensure t
;;   :hook (dart-mode . lsp)
;;   :init
;;   (setq lsp-completion-provider :none)
;;   (setq lsp-diagnostics-provider :none)
;;   :config
;;   (let ((sdk-path (expand-file-name "fvm/versions/stable/" (getenv "HOME"))))
;;     (setq lsp-dart-sdk-dir sdk-path)
;;     (setq lsp-dart-flutter-sdk-dir sdk-path)))

(defun my-dart-mode-setup ()
  "Customize dart-mode: treat underscore as part of a word and disable subword-mode."
  (modify-syntax-entry ?_ "w" dart-mode-syntax-table)
  (company-mode -1)
  (subword-mode -1))

(add-hook 'dart-mode-hook 'my-dart-mode-setup)

(provide 'init-dart)
