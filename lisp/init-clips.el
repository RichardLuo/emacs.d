(require 'clips-mode)
(require 'inf-clips)
(setq inferior-clips-program "clips")

(global-set-key (kbd "C-c C-z") 'run-clips)
(provide 'init-clips)
