(use-package gptel
  :straight (:host github :repo "karthink/gptel" :branch "master")
  :config
  ;; 设置模型（比如 claude-3-sonnet）
  (setq gptel-model "claude-3-sonnet-20240229")

  ;; 读取 API key
  (let ((api-key-file (expand-file-name "claude-api-key.txt" user-emacs-directory)))
    (when (file-exists-p api-key-file)
      (with-temp-buffer
        (insert-file-contents api-key-file)
        (setq gptel-api-key (string-trim (buffer-string))))))

  ;; 设置 Claude 后端（注意：不传 :model）
  (setq gptel-backend
        (gptel-make-anthropic
         "claude"
         :key gptel-api-key
         :stream t))

  ;; 绑定快捷键
  :bind (("C-c g" . gptel-send)
         ("C-c G" . gptel)))

(provide 'init-gptel)
