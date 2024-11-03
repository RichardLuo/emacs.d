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

(defun my-find-file-check-large-file ()
  "If a file is over a given size, disable certain features."
  (when (> (buffer-size) (* 5 1024 1024)) ; 这里设置为 5MB，可根据需要调整
    (fundamental-mode)
    (font-lock-mode -1) ; 禁用语法高亮
    (which-key-mode -1)
    (yas-global-mode -1)
    (setq buffer-read-only t)
    (message "Large file detected, switched to fundamental mode and disabled font-lock.")))

(add-hook 'find-file-hook #'my-find-file-check-large-file)

;; Function to disable lsp-mode for large C/C++ files
(defun my-disable-lsp-mode-for-large-cpp-files ()
  "Disable lsp-mode for large C/C++ files."
  (when (and (or (derived-mode-p 'c-mode) (derived-mode-p 'c++-mode))
             (> (buffer-size) (* 500 1024)))  ;; 如果 C/C++ 文件大于 500KB
    (fundamental-mode)
    (font-lock-mode -1)
    (setq buffer-read-only t)
    (message "Large file detected, switched to fundamental mode and disabled font-lock.")
    (when (bound-and-true-p lsp-mode)
      (message "Disabling lsp-mode for large C/C++ file")
      (lsp-disconnect)
      (setq lsp--buffer-workspaces nil)
      (lsp-mode -1)
      (message "lsp-mode disabled"))))

;; Function to disable lsp-mode for large C/C++ files
(defun my-handle-opening-large-cpp-files ()
  "Disable lsp-mode for large C/C++ files."
  (when (and (or (derived-mode-p 'c-mode) (derived-mode-p 'c++-mode))
             (> (buffer-size) (* 500 1024)))  ;; 如果 C/C++ 文件大于 500KB
    ;; (vlf-mode 1)
    ;; (fundamental-mode)
    ;; (font-lock-mode -1)
    ;; (which-key-mode -1)
    ;; (yas-global-mode -1)
    ;; (setq buffer-read-only t)
    ;; ;; 禁用 company-mode
    ;; (when (bound-and-true-p company-mode)
    ;;   (company-mode -1))
    ;; ;; 禁用 flycheck-mode
    ;; (when (bound-and-true-p flycheck-mode)
    ;;   (flycheck-mode -1))
    ;; ;; 禁用行号显示
    ;; (when (bound-and-true-p display-line-numbers-mode)
    ;;   (display-line-numbers-mode -1))
    ;; 禁用lsp-mode
    (when (bound-and-true-p lsp-mode)
      (message "Disabling lsp-mode for large C/C++ file")
      ;; (lsp-disconnect)
      ;; (setq lsp--buffer-workspaces nil)
      (lsp-mode -1)
      (message "lsp-mode disabled"))
    (message "Large file detected, switched to fundamental mode and disabled font-lock.")
    ))

;; Function to handle large files with vlf and so-long
(defun my-handle-large-files ()
  "Handle large files with vlf and so-long."
  (when (> (buffer-size) (* 5 1024 1024))  ;; 如果文件大于 5MB
    (message "Large file detected, enabling vlf")
    (vlf-mode 1))
  (when (> (buffer-size) (* 3 1024 1024))  ;; 如果文件大于 3MB
    (so-long-mode 1)
    (message "so-long-mode enabled for long lines")))

;; Add hooks to manage large files
(add-hook 'find-file-hook 'my-handle-large-files)
(add-hook 'find-file-hook 'my-handle-opening-large-cpp-files)
;; (add-hook 'find-file-hook 'my-disable-lsp-mode-for-large-cpp-files)

(provide 'init-largefiles)
