(require-package 'undo-tree)
;; (require 'undo-tree-autoloads)
(global-set-key "\C-xu" 'undo-tree-visualize)
(global-undo-tree-mode t)

;; 创建 undo-tree 历史目录（如果不存在）
(let ((undo-tree-dir (concat user-emacs-directory "undo-tree-history/")))
  (unless (file-exists-p undo-tree-dir)
    (make-directory undo-tree-dir t)))

;; 配置 undo-tree 将历史文件存储到特定目录
(setq undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "undo-tree-history/"))))

(diminish 'undo-tree-mode)

(provide 'init-undo-tree)
