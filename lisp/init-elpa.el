;; 检查和启用包签名
(defun sanityinc/package-maybe-enable-signatures ()
  (setq package-check-signature (if (executable-find "gpg") 'allow-unsigned)))
(sanityinc/package-maybe-enable-signatures)

(with-eval-after-load 'init-exec-path
  (sanityinc/package-maybe-enable-signatures))

;; 确保 cl-lib 包已安装
(use-package cl-lib
  :ensure t
  :config
  (unless (package-installed-p 'cl-lib)
    (message "The cl-lib has been automatically installed, but you'd better update to Emacs >= 24.3.
Or, move the cl-lib.el to 'EMACS-INSTALLATION-PATH/lisp/emacs-lisp'")))

(provide 'init-elpa)

;;; init-elpa.el ends here
