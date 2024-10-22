(use-package clang-format
  :ensure t)

(defun clang-format-defun ()
  "Format the current function using clang-format."
  (interactive)
  (save-excursion
    (mark-defun)
    (clang-format-region (region-beginning) (region-end))))

;; (with-eval-after-load 'cc-mode
;;   (define-key c-mode-base-map (kbd "<tab>") 'clang-format-region)
;;   (define-key c-mode-map (kbd "C-c C-q") 'clang-format-defun)
;;   (define-key c++-mode-map (kbd "C-c C-q") 'clang-format-defun))

;; (defun disable-cc-mode-auto-indent ()
;;   "禁用 `cc-mode` 自动缩进和对齐功能。"
;;   (setq c-syntactic-indentation nil)           ; 禁用语法缩进
;;   (setq c-auto-newline nil)                    ; 禁用自动换行和缩进
;;   (setq c-hanging-braces-alist nil)            ; 禁用括号自动对齐
;;   (setq c-hanging-semi&comma-criteria nil)     ; 禁用分号后自动对齐
;;   (electric-indent-local-mode -1)              ; 禁用 electric-indent-mode
;;   (setq c-electric-flag nil)                   ; 禁用电动符号（如分号、冒号等自动缩进）
;;   (setq c-syntactic-indentation nil)           ; 禁用语法缩进
;;   (setq-local electric-layout-rules nil)       ; 禁用 electric-layout-mode
;;   (remove-hook 'c-special-indent-hook 'c-gnu-impose-minimum)
;;   (remove-hook 'c-special-indent-hook 'c-gnu-fixup-whitespace))
;; (add-hook 'c-mode-common-hook 'disable-cc-mode-auto-indent)

;; 使用 clang-format 来替代 cc-mode 的内置对齐功能
(defun clang-format-line ()
  "Format the current line with clang-format."
  (interactive)
  (clang-format-region (line-beginning-position) (line-end-position)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-region-function 'clang-format-region)
            (setq indent-line-function 'clang-format-line)))

(defun disable-cc-mode-auto-indent ()
  "禁用 `cc-mode` 自动缩进和对齐功能。"
  (setq c-syntactic-indentation nil) ; 禁用语法缩进
  (setq c-auto-newline nil)           ; 禁用自动换行和缩进
  (setq c-hanging-braces-alist nil)   ; 禁用括号自动对齐
  (setq c-hanging-semi&comma-criteria nil)) ; 禁用分号后自动对齐

(add-hook 'c-mode-common-hook 'disable-cc-mode-auto-indent)

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; 将 <tab> 键绑定到 clang-format-region
            (define-key c-mode-base-map (kbd "<tab>") 'clang-format-region)
            ;; 将 C-c C-q 键绑定到 clang-format-defun
            (define-key c-mode-base-map (kbd "C-c C-q") 'clang-format-defun)
            ;; 设置 clang-format-region 为 indent-region 的功能
            (setq indent-region-function 'clang-format-region)
            ;; 设置 clang-format-line 为 indent-line 的功能
            (setq indent-line-function 'clang-format-line)))

(add-to-list 'auto-mode-alist '("\\.ipp\\'" . c++-mode))

(provide 'init-clangfmt)
