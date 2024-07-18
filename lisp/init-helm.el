(use-package helm
  :ensure t
  :init
  :config
  (helm-mode 1)
  (setq helm-autoresize-max-height 40) ; 调整 Helm 窗口最大高度的百分比
  (setq helm-autoresize-min-height 20) ; 调整 Helm 窗口最小高度的百分比
  (helm-autoresize-mode 1)             ; 自动调整 Helm 窗口大小
  :bind (("M-x" . helm-M-x)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-x C-f" . helm-find-files)
         ;; ("C-x b" . helm-recentf)
         ("C-x b" . helm-buffers-list)
         ("C-x C-r" . helm-recentf)))   ; 绑定最近文件到快捷键


;; 将默认的搜索替换为 Helm 的搜索
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-r") 'helm-occur)

(provide 'init-helm)
