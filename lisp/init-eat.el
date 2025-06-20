;;; init-eat.el --- Enhanced terminal with eat -*- lexical-binding: t; -*-

;; 安装 eat（选择一个方式即可）

;; 使用 straight.el
(straight-use-package
 '(eat :type git :host codeberg :repo "akib/emacs-eat"))

;; 或者使用 quelpa（如果你 prefer 它）
;; (use-package eat
;;   :ensure nil
;;   :quelpa (eat :fetcher git :url "https://codeberg.org/akib/emacs-eat.git"))

(use-package eat
  :hook
  (eshell-load . eat-eshell-mode)
  :init
  ;; 你可以取消注释下面这行，让 eat-eshell 替代普通 eshell
  ;; (defalias 'eshell #'eat-eshell)

  :config
  ;; 设置 shell 路径（可选）
  (setq eat-shell-file-name "/bin/bash")  ;; 也可以改成 "/bin/zsh"

  ;; 设置中文输入法支持（可选，适用于 macOS）
  ;; (setq eat-enable-input-method t)

  ;; 快捷键（可选）
  (global-set-key (kbd "C-c e") 'eat)
  (global-set-key (kbd "C-c E") 'eat-eshell))

(provide 'init-eat)
