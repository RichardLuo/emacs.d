(defvar my-startup-window-position-and-size-file
  (expand-file-name "window-position-and-size.el" user-emacs-directory)
  "File to save the Emacs window position and size.")

(defun save-startup-window-position-and-size ()
  "Save the current window size and position to a file."
  (interactive)
  (let* ((geometry (frame-geometry))
         (x (car (cdr (assq 'outer-position geometry))))
         (y (cdr (cdr (assq 'outer-position geometry))))
         (width (car (cdr (assq 'outer-size geometry))))
         (height (cdr (cdr (assq 'outer-size geometry)))))
    (with-temp-file my-startup-window-position-and-size-file
      (insert (format "(set-frame-position (selected-frame) %d %d)\n" x y))
      (insert (format "(set-frame-size (selected-frame) %d %d t)\n" width height)))
    (message "Window position and size saved successfully.")))

(defun load-startup-window-position-and-size ()
  "Load the saved window size and position from a file."
  (interactive)
  (when (file-exists-p my-startup-window-position-and-size-file)
    (load-file my-startup-window-position-and-size-file)
    (message "Window position and size loaded successfully.")))

;; Load window size and position on startup
(add-hook 'window-setup-hook 'load-startup-window-position-and-size)

(provide 'init-startup-window)
