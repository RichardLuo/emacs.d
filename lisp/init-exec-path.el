;; 使用 use-package 安装和配置 exec-path-from-shell
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize)
  
  (defun load-special-shell-config ()
    "Load environment variables from a special shell configuration."
    (interactive)
    (let ((shell-file "/opt/nordic/ncs/setup_nrf_sdk_v261.sh"))
      (when (file-exists-p shell-file)
        (with-temp-buffer
          ;; 在临时缓冲区中执行 source 命令并打印所有环境变量
          (insert (format "source %s && printenv\n" shell-file))
          (shell-command-on-region (point-min) (point-max) "*Shell Environment*"))
        ;; 解析并设置环境变量
        (with-current-buffer "*Shell Environment*"
          (goto-char (point-min))
          (while (re-search-forward "\\([^=]+\\)=\\(.*\\)" nil t)
            (let ((env-var (match-string 1))
                  (env-val (match-string 2)))
              (setenv env-var env-val)
              (when (string= env-var "PATH")
                (setq exec-path (append (parse-colon-path env-val) (list exec-directory)))))))
        ;; 清理临时缓冲区
        (kill-buffer "*Shell Environment*")
        (message "Special shell configuration loaded.")))))

(provide 'init-exec-path)
