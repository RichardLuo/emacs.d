(require-package 'magit)
(global-set-key "\C-xgs" 'magit-status)
(setq magit-auto-revert-mode nil)
;; (setq global-auto-revert-mode nil)
(setq magit-refresh-status-buffer nil)
(setq auto-revert-buffer-list-filter
      'magit-auto-revert-repository-buffers-p)


;;(require 'magit-autoloads)
(provide 'init-git)
