;; 加载 lsp-mode 并进行必要的配置
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-file-watch-threshold 10000)  ;; 设置文件监视的阈值
  (setq lsp-enable-file-watchers nil)    ;; 禁用文件监视功能
  :hook ((c-mode c++-mode) . lsp)
  :commands lsp)

;; 加载 ccls 并进行必要的配置
(use-package ccls
  :ensure t
  :after lsp-mode
  :config
  (setq ccls-initialization-options
        '(:index (:comments 2) :completion (:detailedLabel t)))
  :hook ((c-mode c++-mode) . (lambda () (require 'ccls) (lsp))))

;; 可选：安装 lsp-ui 提供更丰富的UI
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(require 'lsp-mode)
(require 'ccls)

(setq ccls-executable "/usr/local/bin/ccls")
;; 启用 LSP 日志记录
(setq lsp-log-io t)
(setq ccls-args '("--log-file=/tmp/ccls.log" "--log-file-append"))

(setq lsp-prefer-flymake nil)  ;; Use flycheck instead of flymake

(with-eval-after-load 'lsp-mode
  (add-hook 'c-mode-hook #'lsp)
  (add-hook 'c++-mode-hook #'lsp)
  (setq lsp-enable-snippet nil)  ;; Disable snippets

  ;; Optional: lsp-ui for better UI
  (require 'lsp-ui)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t))

;; Optional: lsp-treemacs for project-wide navigation
(require 'lsp-treemacs)
(lsp-treemacs-sync-mode 1)

;; ;; 自定义按键绑定
;; (global-set-key (kbd "M-.") 'lsp-find-definition)
;; (global-set-key (kbd "M-,") 'xref-pop-marker-stack)

(provide 'init-lspccls)
