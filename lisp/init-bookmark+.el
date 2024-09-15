;; 检查本地 bookmark-plus 目录是否存在并加载
(defvar my-bookmark-plus-dir (expand-file-name "bookmark-plus" user-emacs-directory))

(if (file-directory-p my-bookmark-plus-dir)
    (progn
      (add-to-list 'load-path my-bookmark-plus-dir)
      (require 'bookmark+))
  (use-package bookmark+
    :quelpa (bookmark+ :fetcher git :url "https://github.com/emacsmirror/bookmark-plus.git")
    :config
    ;; 自动设置书签函数
    (defun my-auto-set-bookmark ()
      "Automatically set a bookmark with surrounding text as the name."
      (interactive)
      (let* ((start (max (point-min) (- (point) 20)))
             (end (min (point-max) (+ (point) 20)))
             (context (buffer-substring-no-properties start end))
             (name (concat "auto-" (replace-regexp-in-string "[\n\t ]+" "-" context))))
        (bmkp-set-autonamed-bookmark-at-line)
        (message "Bookmark set: %s" name)))

    ;; 跳转到最新书签函数
    (defun my-jump-to-latest-bookmark ()
      "Jump to the most recently set bookmark."
      (interactive)
      (let ((bookmark (car bookmark-alist)))
        (bookmark-jump (car bookmark))
        (message "Jumped to bookmark: %s" (car bookmark))))

    ;; 设置全局快捷键
    (global-set-key (kbd "C-c b m") 'my-auto-set-bookmark)
    (global-set-key (kbd "C-c b j") 'my-jump-to-latest-bookmark)))

(provide 'init-bookmark+)
