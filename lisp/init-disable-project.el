(use-package project
  :demand nil
  :config
  ;; 取消绑定特定的函数
  (fmakunbound 'project-find-file)
  (fmakunbound 'project-switch-project)
  (fmakunbound 'project-eshell)
  (fmakunbound 'project-current)
  ;; 清空 project-prefix-map 以禁用快捷键
  (setq project-prefix-map (make-sparse-keymap))
  ;; 显式取消绑定快捷键
  (global-unset-key (kbd "C-x p"))
  (define-key global-map (kbd "C-x p f") nil)
  (define-key global-map (kbd "C-x p e") nil)
  (define-key global-map (kbd "C-x p p") nil))

(provide 'init-disable-project)
