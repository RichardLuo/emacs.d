(use-package exec-path-from-shell
  :ensure t
  :config
  ;; 指定需要从 shell 继承的环境变量列表
  (setq exec-path-from-shell-variables
        '("PATH" "GIT_EXEC_PATH" "GIT_TEMPLATE_DIR" "NRFUTIL_EXEC_PATH" "NRFUTIL_LAUNCHER_VERSION"
          "NRFUTIL_TOOLCHAIN_MANAGER_CURRENT_TOOLCHAIN" "NRFUTIL_TOOLCHAIN_MANAGER_PROMPT_PREFIX"
          "ZDOTDIR" "ZEPHYR_BASE" "ZEPHYR_SDK_INSTALL_DIR" "ZEPHYR_TOOLCHAIN_VARIANT"))
  ;; 初始化 exec-path-from-shell
  (exec-path-from-shell-initialize)

  ;; 自定义函数来加载特定的 shell 脚本
  (defun load-shell-script-env (script)
    "Load environment variables from a shell script."
    (let ((shell-command (concat "source " script " && env")))
      (dolist (line (split-string (shell-command-to-string shell-command) "\n"))
        (let ((split-pos (string-match "=" line)))
          (when split-pos
            (let ((key (substring line 0 split-pos))
                  (value (substring line (1+ split-pos))))
              (setenv key value)
              (when (string-equal key "PATH")
                (setq exec-path (append (parse-colon-path value) (list exec-directory))))))))))

  ;; 定义交互函数，提示用户输入脚本路径并加载环境变量
  (defun load-bash-source ()
    "Prompt for a script path and load environment variables from it."
    (interactive)
    (let ((script (read-file-name "Enter the path of the script: ")))
      (load-shell-script-env script)))

  ;; 定义快捷键 C-c e l 来调用 load-bash-source 函数
  (global-set-key (kbd "C-c e l") 'load-bash-source))


(defvar my-west-build-command-history nil
  "History list for `my-west-build-command`.")

(defun my-west-build-command ()
  "Run west build with environment variables from setup script."
  (interactive)
  (let* ((default-command "source /opt/nordic/ncs/v2.7.0-from6/setup_nrf_sdk_v2.7.0-from6.sh && west build")
         (command (read-shell-command "West build command: " default-command 'my-west-build-command-history)))
    (compile command)))

(global-set-key (kbd "C-c e w") 'my-west-build-command)

(provide 'init-exec-path)
