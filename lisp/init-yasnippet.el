;; 定义工作目录变量
(defvar c-common-snippets-dir (concat user-emacs-directory "snippets/c-common"))
(defvar c-mode-snippets-dir (concat user-emacs-directory "snippets/c-mode"))
(defvar cpp-mode-snippets-dir (concat user-emacs-directory "snippets/c++-mode"))

;; 使用 `use-package` 安装和配置 `yasnippet`
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1) ;; 全局启用 yasnippet 模式
  ;; 添加片段目录
  (add-to-list 'yas-snippet-dirs c-common-snippets-dir)
  (add-to-list 'yas-snippet-dirs c-mode-snippets-dir)
  (add-to-list 'yas-snippet-dirs cpp-mode-snippets-dir))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(provide 'init-yasnippet)
