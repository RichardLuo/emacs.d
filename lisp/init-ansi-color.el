(use-package ansi-color
  :config
  ;; 定义 display-ansi-colors 函数
  (defun display-ansi-colors ()
    (interactive)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max))))

  ;; 可选: 钩子自动处理特定文件类型或模式
  (add-hook 'find-file-hook
            (lambda ()
              (when (string-match "\\.log\\'" buffer-file-name)
                (display-ansi-colors)))))

(provide 'init-ansi-color)
