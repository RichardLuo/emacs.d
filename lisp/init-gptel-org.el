;; init-gptel.el
(use-package gptel
  :straight (:host github :repo "karthink/gptel" :branch "master")
  :config
  ;; 设置默认模型（如果你有 GPT-4o 访问权限，可以写 "gpt-4o"）
  ;; (setq gptel-model "gpt-3.5-turbo")
  (setq gptel-model "gpt-4o")

  ;; 从文件中读取 API key（路径可根据需要调整）
  (let ((api-key-file (expand-file-name "openai-api-key.txt" user-emacs-directory)))
    (when (file-exists-p api-key-file)
      (with-temp-buffer
        (insert-file-contents api-key-file)
        (setq gptel-api-key (string-trim (buffer-string))))))


  (setq gptel-backend
        (gptel-make-openai
            "openai"
          :host "api.openai.com"
          :endpoint "/v1/chat/completions"
          :key gptel-api-key))

  ;; ;; 是否使用 markdown 格式显示代码块
  ;; (setq gptel-use-backtick-for-code nil)

  ;; 快捷键绑定
  :bind (("C-c g" . gptel-send)
         ("C-c G" . gptel)))

(provide 'init-gptel)
