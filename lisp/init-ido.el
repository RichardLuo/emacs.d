;; 使用 use-package 配置 ido
(use-package ido
  :ensure nil  ;; ido 是 Emacs 内置的包，因此不需要安装
  :init
  (ido-mode t)
  (ido-everywhere t)
  (setq ido-enable-flex-matching t)
  (setq ido-use-virtual-buffers t)
  :config
  (defvar ido-cur-item nil)
  (defvar ido-default-item nil)
  (defvar ido-cur-list nil))

;; 使用 use-package 配置 ido-ubiquitous (现已更名为 ido-completing-read+)
(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode t))

;; 使用 use-package 配置 smex
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind (("M-x" . smex)))

;; 使用 use-package 配置 ido-vertical-mode
(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-mode t)
  :config
  (ido-vertical-mode t))

(provide 'init-ido)
