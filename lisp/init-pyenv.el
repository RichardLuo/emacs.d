(use-package pyenv-mode
  :ensure t)

(use-package pyenv-mode-auto
  :ensure t
  :after pyenv-mode)

(defun my/pyenv-current-version ()
  (when (fboundp 'pyenv-mode-version)
    (let ((ver (pyenv-mode-version)))
      (if ver (format " [pyenv:%s]" ver) ""))))

(setq-default mode-line-format
              (append mode-line-format
                      '((:eval (my/pyenv-current-version)))))

;; 默认启动时使用 mysys 环境
(with-eval-after-load 'pyenv-mode
  (pyenv-mode-set "3.13.4/envs/mysys"))

(provide 'init-pyenv)
