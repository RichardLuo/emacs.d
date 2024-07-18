;; 使用 use-package 安装和配置 magit
(use-package magit
  :bind (("C-x g s" . magit-status)
         ("C-x g l" . magit-log-current)
         ("C-x g b" . magit-branch)
         ("C-x g c" . magit-commit)
         ("C-x g p" . magit-push)
         ("C-x g f" . magit-pull))
  :config
  ;; 禁用 magit 自动刷新模式
  (setq magit-auto-revert-mode nil)
  ;; 禁用 magit 状态缓冲区自动刷新
  (setq magit-refresh-status-buffer nil)
  ;; ;; 设置 auto-revert 缓冲区列表过滤器
  ;; (setq auto-revert-buffer-list-filter
  ;;       'magit-auto-revert-repository-buffers-p)
  )

;; 提供特性
(provide 'init-git)
