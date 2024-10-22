(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c p"))  ; pick your own prefix key here
  :init
  (persp-mode))

(setq persp-state-default-file "~/.emacs.default/persp-state") ; 保存路径
(add-hook 'kill-emacs-hook #'persp-state-save) ; 退出时自动保存透视图状态
(add-hook 'emacs-startup-hook #'persp-state-load) ; 启动时自动恢复透视图

;; (desktop-save-mode 1)

(provide 'init-perspective)
