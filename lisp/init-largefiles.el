;; Load use-package for managing packages
(require 'use-package)

;; Load vlf for handling very large files
(use-package vlf
  :ensure t
  :config
  (require 'vlf-setup))

;; Load so-long for handling long lines
(use-package so-long
  :ensure t
  :config
  (global-so-long-mode 1))

;; Function to disable lsp-mode for large C/C++ files
(defun my-disable-lsp-mode-for-large-cpp-files ()
  "Disable lsp-mode for large C/C++ files."
  (when (and (or (derived-mode-p 'c-mode) (derived-mode-p 'c++-mode))
             (> (buffer-size) (* 500 1024)))  ;; 如果 C/C++ 文件大于 500KB
    (when (bound-and-true-p lsp-mode)
      (message "Disabling lsp-mode for large C/C++ file")
      (lsp-disconnect)
      (setq lsp--buffer-workspaces nil)
      (lsp-mode -1))))

;; Function to handle large files with vlf and so-long
(defun my-handle-large-files ()
  "Handle large files with vlf and so-long."
  (when (> (buffer-size) (* 5 1024 1024))  ;; 如果文件大于 5MB
    (message "Large file detected, enabling vlf")
    (vlf-mode 1))
  (when (> (buffer-size) (* 1024 1024))  ;; 如果文件大于 1MB
    (so-long-mode 1)))

;; Function to adjust font-lock decoration based on file size
(defun my-adjust-font-lock-for-large-files ()
  "Adjust font-lock decoration based on file size."
  (when (> (buffer-size) (* 1 1024 1024))  ; 文件大于 1MB
    (setq font-lock-maximum-decoration 1)
    (font-lock-refresh-defaults)
    (message "Adjusting font-lock decoration for large file")))

;; Function to disable font-lock mode for very large files
(defun my-disable-font-lock-for-very-large-files ()
  "Disable font-lock mode for large files."
  (when (> (buffer-size) (* 10 1024 1024))  ; 文件大于 10MB
    (font-lock-mode -1)
    (message "Disabling font-lock-mode for very large file")))

;; Add hooks to manage large files
(add-hook 'find-file-hook 'my-disable-lsp-mode-for-large-cpp-files)
(add-hook 'find-file-hook 'my-handle-large-files)
(add-hook 'find-file-hook 'my-adjust-font-lock-for-large-files)
(add-hook 'find-file-hook 'my-disable-font-lock-for-very-large-files)

(provide 'init-largefiles)
