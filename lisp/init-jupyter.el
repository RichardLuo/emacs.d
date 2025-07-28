;; (use-package polymode
;;   :straight (:host github :repo "polymode/polymode"
;;                    :commit "3c5cc5fd56bfe1fc3023b12e6604e24483a0e26c"))

(use-package polymode
  :straight (:host github :repo "polymode/polymode"))


(use-package request :ensure t)
(use-package websocket :ensure t)
(use-package ein :ensure t)

(use-package polymode
  :straight t
  :config
  ;; 兼容 EIN 缺失函数 pm--visible-buffer-name 的错误
  (unless (fboundp 'pm--visible-buffer-name)
    (defun pm--visible-buffer-name (&optional buffer)
      "Fallback for EIN compatibility. Returns the name of the BUFFER or current buffer."
      (buffer-name (or buffer (current-buffer))))))


;; (with-eval-after-load 'ob-jupyter
;;   (jupyter-org-define-src-block "python"))

(provide 'init-jupyter)
