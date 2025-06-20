(use-package lsp-sourcekit
  :ensure t
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable
        "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))

(use-package swift-mode
  :ensure t
  :mode ("\\.swift\\'" . swift-mode))

(provide 'init-swift)
