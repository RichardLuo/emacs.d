(use-package kconfig-mode
  :ensure t)

(use-package cmake-mode
  :ensure t
  :config
  ;; 自动加载 cmake-mode
  (autoload 'cmake-mode "cmake-mode" "Major mode for editing CMake files" t)
  (add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
  (add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

  ;; 为 cmake-mode 设置代码缩进
  (setq cmake-tab-width 4)
  (add-hook 'cmake-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil)
              (setq tab-width cmake-tab-width)
              (setq c-basic-offset cmake-tab-width))))

;; 启用 cmake-mode 的自动补全功能
(require 'company)
(add-hook 'cmake-mode-hook
          (lambda ()
            (company-mode)
            (setq-local company-backends '(company-cmake))))

;; 设置 cmake-mode 的快捷键
(with-eval-after-load 'cmake-mode
  (define-key cmake-mode-map (kbd "C-c C-d") 'cmake-help-command)
  (define-key cmake-mode-map (kbd "C-c C-r") 'cmake-reload-all))
