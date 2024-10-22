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
  (global-set-key (kbd "C-c b j") 'my-jump-to-latest-bookmark))

(defun insert-bookmark-link (bookmark-name)
  "Insert a link to a bookmark in org-mode format."
  (interactive "Enter bookmark name: ")
  (let ((link (format "[[bookmark:%s][%s]]" bookmark-name bookmark-name)))
    (insert link)))

(provide 'init-bookmark+)
