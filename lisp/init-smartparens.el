;; 确保 diminish 已安装
(use-package diminish
  :ensure t)

;; 启用 smartparens 全局模式
(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config) ;; 加载 smartparens 默认配置
  (smartparens-global-mode t)   ;; 全局启用 smartparens
  ;; 自定义绑定
  (bind-key "C-M-f" 'sp-forward-sexp smartparens-mode-map)
  (bind-key "C-M-b" 'sp-backward-sexp smartparens-mode-map)
  (bind-key "C-M-u" 'sp-backward-up-sexp smartparens-mode-map)
  (bind-key "C-M-d" 'sp-down-sexp smartparens-mode-map)
  (bind-key "C-M-k" 'sp-kill-sexp smartparens-mode-map)
  (bind-key "C-M-t" 'sp-transpose-sexp smartparens-mode-map)
  ;; 取消模式行显示
  (diminish 'smartparens-mode))

(provide 'init-smartparens)
