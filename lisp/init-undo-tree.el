;; 定义 undo-tree 历史文件的目录
(defvar undo-tree-history-dir (concat user-emacs-directory "undo"))

;; 启用 undo-tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode)
  :config
  ;; Prevent undo tree files from polluting your git repo
  (setq undo-tree-history-directory-alist `(("." . ,undo-tree-history-dir)))
  ;; 自动保存 undo-tree 的历史
  (setq undo-tree-auto-save-history t))

(provide 'init-undo-tree)
