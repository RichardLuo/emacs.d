(use-package gptel
  :straight (:host github :repo "karthink/gptel" :branch "master")
  :config
  ;; (setq gptel-model "gpt-4o")
  (setq gptel-model "gpt-3.5-turbo")


  ;; 读取 API key
  (let ((api-key-file (expand-file-name "openai-api-key.txt" user-emacs-directory)))
    (when (file-exists-p api-key-file)
      (with-temp-buffer
        (insert-file-contents api-key-file)
        (setq gptel-api-key (string-trim (buffer-string))))))

  ;; 不设置 gptel-backend，让 gptel 使用默认 openai-backend
  ;; 它内部自动设定了 host、endpoint 和 headers，最不容易出错

  :bind (("C-c g" . gptel-send)
         ("C-c G" . gptel)))

(provide 'init-gptel)
