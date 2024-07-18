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

;; Function to disable lsp-mode for large files
(defun my-disable-lsp-mode-for-large-files ()
  "Disable lsp-mode for large files."
  (when (> (buffer-size) (* 1024 1024))  ;; 如果文件大于1MB
    (when (bound-and-true-p lsp-mode)
      (message "Disabling lsp-mode for large file")
      (lsp--shutdown-workspace)  ;; 确保关闭 lsp 工作区
      (setq lsp--buffer-workspaces nil)
      (lsp-mode -1))))

;; Function to handle large files with vlf and so-long
(defun my-handle-large-files ()
  "Handle large files with vlf and so-long."
  (when (> (buffer-size) (* 1024 1024))  ;; 如果文件大于1MB
    (message "Large file detected, enabling vlf and so-long")
    (vlf-mode 1)  ;; 启用 vlf-mode
    (so-long-mode 1)))

;; Add hooks to manage large files
(add-hook 'find-file-hook #'my-disable-lsp-mode-for-large-files)
(add-hook 'find-file-hook #'my-handle-large-files)
(add-hook 'after-find-file-hook #'my-handle-large-files)

(defun my-adjust-font-lock-for-large-files ()
  "Adjust font-lock decoration based on file size."
  (when (> (buffer-size) (* 1 1024 1024))  ; 文件大于 1MB
    (setq font-lock-maximum-decoration 1)))

(add-hook 'find-file-hook 'my-adjust-font-lock-for-large-files)

(defun my-disable-font-lock-for-large-files ()
  "Disable font-lock mode for large files."
  (when (> (buffer-size) (* 10 1024 1024))  ; 文件大于 10MB
    (font-lock-mode -1)))

(add-hook 'find-file-hook 'my-disable-font-lock-for-large-files)

(provide 'init-largefiles)
