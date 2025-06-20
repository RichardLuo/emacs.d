(use-package tree-sitter
  :ensure t
  :config
  ;; 启用 Tree-sitter
  (global-tree-sitter-mode)
  
  ;; (add-to-list 'treesit-extra-load-path
  ;;              "/Users/richard/.emacs.default/elpa/tree-sitter-langs-20241110.1307/bin/")

  ;; 启用支持的语言
  (use-package tree-sitter-langs
    :ensure t))

;; (use-package tree-sitter-langs
;;   :ensure t
;;   :config
;;   ;; This is just for troubleshooting, should load correctly once Emacs is restarted.
;;   (message "tree-sitter-langs loaded"))



;; (use-package tree-sitter
;;   :ensure t
;;   :config
;;   (setq treesit-language-source-alist
;;         '((c    . "https://github.com/tree-sitter/tree-sitter-c.git")
;;           (cpp  . "https://github.com/tree-sitter/tree-sitter-cpp.git")))
;;   ;; 自动下载和编译 C 和 C++ 语法库
;;   (add-hook 'c-mode-hook #'tree-sitter-mode)
;;   (add-hook 'cpp-mode-hook #'tree-sitter-mode))
;; (use-package tree-sitter-langs
;;   :ensure t)

;; (treesit-language-available-p 'swift)
;; (setq treesit--debug t)

(provide 'init-tree-sitter)
