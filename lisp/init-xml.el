;; 配置 nXML 模式
(defun my-nxml-mode-setup ()
  ;; 禁用自动语法验证以提高性能
  (setq nxml-slash-auto-complete-flag nil)  ;; 禁用自动补全
  (setq nxml-sexp-element-flag nil)         ;; 禁用自动匹配元素
  (setq rng-nxml-auto-validate-flag nil)    ;; 禁用自动验证

  ;; 禁用 Font-Lock 语法高亮模式以减少保存时的延迟
  (font-lock-mode 1)

  ;; 禁用智能括号模式
  (smartparens-mode -1)

  ;; 禁用 auto-save 和备份
  (setq auto-save-default nil)              ;; 禁用自动保存
  (setq make-backup-files nil))             ;; 禁用备份文件

;; 将上述设置应用于 nxml-mode
(add-hook 'nxml-mode-hook 'my-nxml-mode-setup)

;; 提供特性
(provide 'init-xml)
