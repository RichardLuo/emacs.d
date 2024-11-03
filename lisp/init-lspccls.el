;; (use-package lsp-mode
;;   :ensure t
;;   :init
;;   ;; 设置文件监视阈值，防止过多文件监视导致的性能问题
;;   (setq lsp-file-watch-threshold 10000)
;;   ;; 禁用文件监视
;;   (setq lsp-enable-file-watchers nil)
;;   ;; 调整 lsp-mode 的性能参数
;;   (setq lsp-idle-delay 0.5) ;; 延迟时间，减少频繁的请求
;;   (setq lsp-completion-provider :capf) ;; 使用更轻量级的补全框架
;;   :hook ((c-mode c++-mode) . lsp)
;;   :commands lsp
;;   :config
;;   ;; 使用 ccls 作为 LSP 服务器
;;   (setq lsp-clients-ccls-executable "/usr/local/bin/ccls"))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-prefer-flymake nil)  ;; Use flycheck instead of flymake
  ;; 设置文件监视阈值，防止过多文件监视导致的性能问题
  (setq lsp-keymap-prefix "s-l") ;; 设置 super+l 作为 lsp-mode 前缀键
  (setq lsp-file-watch-threshold 10000)
  ;; 禁用文件监视
  (setq lsp-enable-file-watchers nil)
  ;; 调整 lsp-mode 的性能参数
  (setq lsp-idle-delay 1.0) ;; 延迟时间，减少频繁的请求
  (setq lsp-completion-provider :capf) ;; 使用更轻量级的补全框架
  :bind
  (
   ;; ("s-d" . lsp-find-definition) ;; super+d 查找定义
   ("s-s" . lsp-find-references) ;; super+r 查找引用
   ("s-i" . lsp-find-implementation) ;; super+i 查找实现
   ("s-h" . lsp-describe-thing-at-point) ;; super+h 显示描述
   ("s-r" . lsp-signature-help) ;; super+s 显示签名帮助
   ("s-a" . lsp-execute-code-action) ;; super+a 执行代码操作
   ("s-f" . lsp-format-buffer) ;; super+f 格式化缓冲区
   ("s-n" . lsp-rename) ;; super+n 重命名符号
   ("s-p" . lsp-ui-peek-find-definitions) ;; super+p 查看定义
   ("s-t" . lsp-ui-peek-find-references) ;; super+t 查看引用
   ("s-e" . lsp-treemacs-errors-list)) ;; super+e 显示错误列表
  :hook ((c-mode c++-mode) . lsp)
  :commands lsp
  :config
  (setq lsp-log-io nil)
  ;; (setq ccls-initialization-options
  ;;       '(:clang (:extraArgs ["-Wno-vla-extension" "-std=c++17" "-std=gnu++17"])
  ;;                :index (
  ;;                        :comments 0
  ;;                        :threads 2)
  ;;                :completion (:detailedLabel t)
  ;;                :diagnostics (:onChange 200)))
  ;; (setq lsp-lens-enable nil)
  )

;; (add-hook 'lsp-before-initialize-hook
;;           (lambda ()
;;             (setq ccls-args '("--log-file=/tmp/ccls.log" "--log-file-append" "-v 2"))))

;; 安装并配置 which-key 以便查看按键绑定提示
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; 启用 Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (setq treemacs-width 30)
  (treemacs-follow-mode nil)
  (treemacs-filewatch-mode nil)
  (treemacs-git-mode 'simple))

;; 启用 lsp-treemacs 并与 lsp-mode 集成
(use-package lsp-treemacs
  :ensure t
  :after (lsp-mode treemacs)
  :commands (lsp-treemacs-errors-list lsp-treemacs-symbols lsp-treemacs-references lsp-treemacs-implementations lsp-treemacs-call-hierarchy lsp-treemacs-workspace)
  :config
  (lsp-treemacs-sync-mode 1)
  ;; 绑定快捷键以方便使用
  (global-set-key (kbd "C-c l e") 'lsp-treemacs-errors-list)
  ;; (global-set-key (kbd "C-c l s") 'lsp-treemacs-symbols)
  (global-set-key (kbd "C-c l r") 'lsp-treemacs-references)
  (global-set-key (kbd "C-c l i") 'lsp-treemacs-implementations)
  (global-set-key (kbd "C-c l c") 'lsp-treemacs-call-hierarchy)
  (global-set-key (kbd "C-c l w") 'lsp-treemacs-workspace))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable nil)  ;; 禁用符号的悬浮文档
  (setq lsp-ui-sideline-enable nil)               ;; 启用旁注功能
  (setq lsp-ui-sideline-show-hover nil)           ;; 禁用悬停信息
  (setq lsp-ui-sideline-show-diagnostics t)     ;; 启用诊断信息
  (setq lsp-ui-sideline-show-code-actions nil)  ;; 禁用代码操作
  (setq lsp-ui-sideline-show-symbol t)          ;; 启用符号信息
  (setq lsp-ui-sideline-delay 1.0)              ;; 增加延迟，减少频繁刷新
  (setq lsp-ui-sideline-ignore-duplicate t)     ;; 仅在当前行显示旁注
  (setq lsp-ui-sideline-update-mode 'line)      ;; 使用 line 模式更新旁注
  (setq lsp-ui-sideline-diagnostic-max-lines 1) ;; 限制诊断信息行数
  (setq lsp-ui-sideline-diagnostic-max-line-length 100) ;; 限制诊断信息行长度
  ;; 配置 lsp-ui-sideline 的布局，使其在行末显示
  (setq lsp-ui-sideline-code-actions-prefix "⧉ ")
  (setq lsp-ui-sideline-diagnostic-prefix "⚠️ ")
  ;; 调整旁注字体大小
  (custom-set-faces
   '(markdown-code-face ((t (:inherit default))))
   '(lsp-ui-sideline-code-action ((t (:height 0.4))))
   '(lsp-ui-sideline-current-symbol ((t (:height 0.4))))
   '(lsp-ui-sideline-symbol ((t (:height 0.4))))
   '(lsp-ui-sideline-diagnostics ((t (:height 0.4))))))
  

;; ;; 加载 ccls 并进行必要的配置
;; (use-package ccls
;;   :ensure t
;;   :after lsp-mode
;;   :config
;;   (setq ccls-args '("--log-file=/tmp/ccls.log" "--log-file-append" "-v 2")))

;; 增加垃圾回收阈值
(setq gc-cons-threshold 300000000) ;; 100MB

(setq lsp-enable-symbol-highlighting nil)
(setq lsp-enable-snippet nil)

(with-eval-after-load 'lsp-mode
  (add-hook 'c-mode-hook #'lsp)
  (add-hook 'c++-mode-hook #'lsp)
  (setq lsp-enable-snippet nil))  ;; Disable snippets

(defun my-lsp-find-definition ()
  "Find definition even if the point is at the end of a symbol."
  (interactive)
  (if (or (eobp) (eq (char-syntax (char-before)) ?w))
      (backward-char))
  (lsp-find-definition))

(global-set-key (kbd "M-.") 'my-lsp-find-definition)

;; 自定义按键绑定
;; (global-set-key (kbd "M-.") 'lsp-find-definition)
;; (global-set-key (kbd "M-,") 'xref-pop-marker-stack)

;; Ignore .dir-locals.el for LSP
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\.dir-locals\\.el$")
  (add-to-list 'lsp-language-id-configuration '(lisp-data-mode . "lisp")))

(setq lsp-file-watch-ignored
      '("[/\\\\]\\.git$"
        "[/\\\\]\\.hg$"
        "[/\\\\]\\.bzr$"
        "[/\\\\]_darcs$"
        "[/\\\\]\\.svn$"
        "[/\\\\]_FOSSIL_$"
        "[/\\\\]\\.idea$"
        "[/\\\\]\\.ensime_cache$"
        "[/\\\\]\\.eunit$"
        "[/\\\\]node_modules$"
        "[/\\\\]\\.yarn$"
        "[/\\\\]\\.fslckout$"
        "[/\\\\]\\.tox$"
        "[/\\\\]\\.nox$"
        "[/\\\\]dist$"
        "[/\\\\]dist-newstyle$"
        "[/\\\\]\\.stack-work$"
        "[/\\\\]\\.bloop$"
        "[/\\\\]\\.metals$"
        "[/\\\\]\\.ccls-cache$"
        "[/\\\\]\\.vs$"
        "[/\\\\]\\.vscode$"
        "[/\\\\]\\.venv$"
        "[/\\\\]\\.mypy_cache$"
        "[/\\\\]\\.pytest_cache$"
        "[/\\\\]__pycache__$"
        "[/\\\\]\\.deps$"
        "[/\\\\]autom4te.cache$"
        "[/\\\\]\\.reference$"
        "[/\\\\]bazel-[^/\\\\]+$"
        "[/\\\\]\\.cache/lsp-csharp$"
        "[/\\\\]\\.meta$"
        "[/\\\\]\\.nuget$"
        "[/\\\\]\\.lsp$"
        "[/\\\\]\\.clj-kondo$"
        "[/\\\\]\\.shadow-cljs$"
        "[/\\\\]\\.babel_cache$"
        "[/\\\\]\\.cpcache$"
        "[/\\\\]checkouts$"
        "[/\\\\]\\.gradle$"
        "[/\\\\]\\.m2$"
        "[/\\\\]\\.elixir_ls$"
        "[/\\\\]\\.elixir-tools$"
        "[/\\\\]\\.terraform$"
        "[/\\\\]\\.terragrunt-cache$"
        "[/\\\\]result$"
        "[/\\\\]result-bin$"
        "[/\\\\]\\.direnv$"))


(put 'lsp-enabled 'safe-local-variable 'booleanp)
;; (put 'lsp-clients-clangd-args 'safe-local-variable 'listp)
(put 'ccls-initialization-options 'safe-local-variable 'listp)

;; 将特定的 eval 表达式标记为安全的
(put 'lsp-file-watch-ignored-directories 'safe-local-variable
     (lambda (x) (and (listp x) (cl-every 'stringp x))))
(put 'eval 'safe-local-variable
     (lambda (x) (or (stringp x) (memq x '(let ignored-dirs setq append)))))

(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))


;; Install and configure lsp-ivy
(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol
  :config
  ;; Bind the key for lsp-ivy-workspace-symbol
  (global-set-key (kbd "C-c l s") 'lsp-ivy-workspace-symbol))

(defun my-switch-to-xref-buffer ()
  "Switch to the *xref* buffer."
  (interactive)
  (let ((xref-buffer (get-buffer "*xref*")))
    (if xref-buffer
        (switch-to-buffer-other-window xref-buffer)
      (message "No xref buffer found."))))

(global-set-key (kbd "s-b") 'my-switch-to-xref-buffer)


(add-hook 'find-file-hook
          (lambda ()
            (when (and (derived-mode-p 'c-mode 'c++-mode)
                       (>= (buffer-size) (* 100 1024))) ;; 大于100KB的文件
              (lsp-disconnect)
              (message "LSP features disabled for large file"))))

(provide 'init-lspccls)
