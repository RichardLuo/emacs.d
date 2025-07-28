(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
                         :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
                         :build (:not compile))
  :custom
  (acm-enable-yas nil)
  (acm-enable-icon nil)
  (acm-enable-tabnine nil)
  (acm-enable-codeium nil)
  (acm-enable-capf t)
  (acm-enable-search-file-words nil)
  (acm-doc-frame-max-lines 25)
  (lsp-bridge-nix-lsp-server "nil")
  (lsp-bridge-enable-hover-diagnostic t)
  (lsp-bridge-code-action-enable-popup-menu nil)
  (lsp-bridge-enable-inlay-hint nil)
  (lsp-bridge-inlay-hint-overlays '())
  :init
  ;; (setq lsp-bridge-enable-imenu t)
  (setq lsp-bridge-python-lsp-server "pyright")
  (setq lsp-bridge-enable-log t)
  (setq lsp-bridge-python-command "~/.lsp-bridge-env/bin/python")
  (setq-default lsp-bridge-enable-inlay-hint nil)
  (global-lsp-bridge-mode)
  (let ((filtered-list (cl-delete 'lsp-bridge-not-match-hide-characters lsp-bridge-completion-popup-predicates)))
    (setq lsp-bridge-completion-popup-predicates filtered-list))
  ;; <ret> is very annoying because lsp-bridge is too fast, unset it

  (keymap-unset acm-mode-map "RET")

  ;; (define-key lsp-bridge-mode-map (kbd "C-c e") 'lsp-bridge-diagnostic-jump-next)
  ;; (define-key lsp-bridge-mode-map (kbd "C-c f") 'lsp-bridge-find-def)
  ;; (define-key lsp-bridge-mode-map (kbd "C-c n") 'lsp-bridge-rename)
  ;; (define-key lsp-bridge-mode-map (kbd "C-c a") 'lsp-bridge-code-action)
  ;; (define-key lsp-bridge-mode-map (kbd "C-c r") 'lsp-bridge-find-references)
  ;; (define-key lsp-bridge-mode-map (kbd "C-c h") 'lsp-bridge-popup-documentation)

  :bind (:map lsp-bridge-mode-map
              ("s-d" . lsp-bridge-find-def) ;; super+d 查找定义
              ("s-D" . lsp-bridge-popup-documentation) ;; super+d 查找定义
              ("s-q" . lsp-bridge-find-def-return)
              ("s-p" . lsp-bridge-peek)
              ("s-s" . lsp-bridge-find-references) ;; super+s 查找引用
              ("s-S" . lsp-bridge-workspace-list-symbols) ;; super+s 查找引用
              ("s-i" . lsp-bridge-find-impl) ;; super+i 查找实现
              ("s-h" . lsp-bridge-hover) ;; super+h 显示描述
              ("s-a" . lsp-bridge-code-action) ;; super+a 执行代码操作
              ("s-f" . lsp-bridge-format-buffer) ;; super+f 格式化缓冲区
              ("s-n" . lsp-bridge-rename) ;; super+n 重命名符号
              ("s-e" . lsp-bridge-diagnostic-list)) ;; super+e 显示错误列表
)

;; Force override lsp-bridge's default JVM args
(setq lsp-bridge-jdtls-jvm-args 
      '("-Declipse.application=org.eclipse.jdt.ls.core.id1"
        "-Dosgi.bundles.defaultStartLevel=4" 
        "-Declipse.product=org.eclipse.jdt.ls.core.product"
        "-Xms512m"
        "-Xmx1G"))

;; Make sure this is set before lsp-bridge loads
(with-eval-after-load 'lsp-bridge
  (setq lsp-bridge-jdtls-jvm-args 
        '("-Declipse.application=org.eclipse.jdt.ls.core.id1"
          "-Dosgi.bundles.defaultStartLevel=4"
          "-Declipse.product=org.eclipse.jdt.ls.core.product" 
          "-Xms512m"
          "-Xmx1G")))

(with-eval-after-load 'lsp-bridge
  (define-key lsp-bridge-peek-keymap (kbd "M-N") nil) ;; 移除 M-N
  (define-key lsp-bridge-peek-keymap (kbd "M-P") nil) ;; 移除 M-P
  (define-key lsp-bridge-peek-keymap (kbd "M-n") nil) ;; 移除 M-n
  (define-key lsp-bridge-peek-keymap (kbd "M-p") nil) ;; 移除 M-p
  (define-key lsp-bridge-ref-mode-map (kbd "n") 'lsp-bridge-ref-jump-next-keyword)
  (define-key lsp-bridge-ref-mode-map (kbd "p") 'lsp-bridge-ref-jump-prev-keyword)
  ;; 可选：取消默认的 j 和 k 绑定
  (define-key lsp-bridge-ref-mode-map (kbd "j") nil)
  (define-key lsp-bridge-ref-mode-map (kbd "k") nil))

(setq lsp-bridge-enable-signature-help nil)

;; (use-package lsp-bridge
;;   :straight (lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge")
;;   :init
;;   (setq lsp-bridge-enable-imenu t)) ; 启用 imenu 支持
;; (setq lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
;; (setq lsp-bridge-signature-help-fetch-idle 10)
;; (setq eldoc-echo-area-use-multiline-p nil)
;; (setq lsp-bridge-enable-doc-popup nil)
;; (global-eldoc-mode -1)

(defun my/lsp-bridge-find-references ()
  "先记录当前源码位置，再执行 lsp-bridge-find-references."
  (interactive)
  ;; 这里的 mark-ring 记录的是源文件位置 ✅
  (when (fboundp 'lsp-bridge--record-mark-ring)
    (lsp-bridge--record-mark-ring))
  ;; 然后正常打开 *lsp-bridge-ref* buffer
  (lsp-bridge-find-references))

(setq lsp-bridge-java-command "/opt/homebrew/opt/openjdk@21/bin/java")
(setenv "PATH" (concat "/opt/homebrew/opt/openjdk@21/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/opt/homebrew/opt/openjdk@21/bin")

(setenv "PATH" (concat (expand-file-name "~/bin/fake-jdtls") ":" (getenv "PATH")))
(add-to-list 'exec-path (expand-file-name "~/bin/fake-jdtls"))

(provide 'init-lsp-bridge)

