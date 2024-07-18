;; 设置 bookmark+ 的路径
(defvar bookmark-plus-dir (concat user-emacs-directory "bookmark-plus"))

;; 加载 bookmark+
(use-package bookmark+
  :load-path bookmark-plus-dir)

(defun my-auto-set-bookmark ()
  "Automatically set a bookmark with surrounding text as the name."
  (interactive)
  (let* ((start (max (point-min) (- (point) 20)))
         (end (min (point-max) (+ (point) 20)))
         (context (buffer-substring-no-properties start end))
         (name (concat "auto-" (replace-regexp-in-string "[\n\t ]+" "-" context))))
    (bmkp-set-autonamed-bookmark-at-line)
    (message "Bookmark set: %s" name)))

(defun my-jump-to-latest-bookmark ()
  "Jump to the most recently set bookmark."
  (interactive)
  (let ((bookmark (car bookmark-alist)))
    (bookmark-jump (car bookmark))
    (message "Jumped to bookmark: %s" (car bookmark))))

(global-set-key (kbd "C-c b m") 'my-auto-set-bookmark)
(global-set-key (kbd "C-c b j") 'my-jump-to-latest-bookmark)

(provide 'init-bookmark+)
