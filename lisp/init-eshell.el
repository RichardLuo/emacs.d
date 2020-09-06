;; (setq eshell-prompt-function
;;       (lambda ()
;;         (concat "[" (getenv "USER") 
;;                 "@eshell]"
;; ;;                "@" (getenv "HOSTNAME") "] "
;; ;;                "(" (format-time-string "%a %b %e %l:%M %p") ") "
;; ;;                (eshell/pwd)
;; ;;                (if (= (user-uid) 0) "\n # " "\n $ "))))
;;                 (if (= (user-uid) 0) "# " "$ "))))

(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
        (beginning-of-line))))

(defun eshell/vi (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      ;; If I just ran "emacs", I probably expect to be launching
      ;; Emacs, which is rather silly since I'm already in Emacs.
      ;; So just pretend to do what I ask.
      (bury-buffer)
    ;; We have to expand the file names or else naming a directory in an
    ;; argument causes later arguments to be looked for in that directory,
    ;; not the starting directory
    (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))

(defun eshell/vim (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      ;; If I just ran "emacs", I probably expect to be launching
      ;; Emacs, which is rather silly since I'm already in Emacs.
      ;; So just pretend to do what I ask.
      (bury-buffer)
    ;; We have to expand the file names or else naming a directory in an
    ;; argument causes later arguments to be looked for in that directory,
    ;; not the starting directory
    (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))

(defun eshell/info (&optional subject)
  "Invoke `info', optionally opening the Info system to SUBJECT."
  (let ((buf (current-buffer)))
    (Info-directory)
    (if (not (null subject))
        (let ((node-exists (ignore-errors (Info-menu subject))))
          (if (not node-exists)
              (format "No menu item `%s' in node `(dir)Top'." subject))))))

(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
        (beginning-of-line))))

(add-hook 'eshell-mode-hook
          '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-maybe-bol)))

(add-hook 'eshell-mode-hook
          '(lambda () (define-key eshell-mode-map "\M-m" 'eshell-maybe-bol)))



;; (add-hook 'eshell-mode-hook 'my-eshell-mode-common-hook)
;; (defun my-eshell-mode-common-hook()
;;   (setq grep-find-command
;;         "find . -type f -print0 | xargs -0 -e grep -nHIE "))



(defun file-name-base (&optional filename)
  "Return the base name of the FILENAME: no directory, no extension.
FILENAME defaults to `buffer-file-name'."
  (file-name-sans-extension
   (file-name-nondirectory (or filename (buffer-file-name)))))

(defun shortened-path (path max-len)
  "Return a modified version of `path', replacing some components
      with single characters starting from the left to try and get
      the path down to `max-len'"
  (let* ((components (split-string (abbreviate-file-name path) "/"))
         (len (+ (1- (length components))
                 (reduce '+ components :key 'length)))
         (str ""))
    (while (and (> len max-len)
                (cdr components))
      (setq str (concat str (if (= 0 (length (car components)))
                                "/"
                              (string (elt (car components) 0) ?/)))
            len (- len (1- (length (car components))))
            components (cdr components)))
    (concat str (reduce (lambda (a b) (concat a "/" b)) components))))

(setq eshell-prompt-function
      (lambda ()
      (concat (shortened-path (eshell/pwd) 40)
              (if (= (user-uid) 0) " # " " $ "))))

;; (setq eshell-prompt-function
;;       (lambda ()
;;         (concat (getenv "USER") "@"
;;                 (file-name-base (eshell/pwd)) " $ ")))

(global-set-key "\C-z" 'eshell)
(define-key global-map (kbd "s-z") 'shell)
(provide 'init-eshell)


