;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-utils)
(require 'init-elpa)
;; (require 'init-ido)
(require 'init-ivy)
(require 'init-exec-path)

;; This is commented out by default, but for security considerations
;; I strongly recommend you to uncomment it.
;; You may need `gnutls' library and the `certifi' python package to enable this.
;; see the comment in `init-security.el'
;; (require 'init-security)

;; Machinery for installing required packages.
;; explicitly call 'package-initialize to set up all packages installed via ELPA.
;; should come before all package-related config files
(require 'init-kill-ring)
;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

;; (require-package 'wgrep)
;; (require-package 'project-local-variables)
;; (require-package 'diminish)
;; (require-package 'scratch)
;; (require-package 'mwe-log-commands)

;; (require 'init-frame-hooks)
;; (require 'init-xterm)
;; (require 'init-osx-keys)
;; (require 'init-gui-frames)
;; (require 'init-proxies)
;; (require 'init-dired)
;; (require 'init-isearch)
;; (require 'init-uniquify)
;; (require 'init-ibuffer)
;; (require 'init-flycheck)
(require 'init-git)
(require 'init-gdb)

(require 'init-recentf)
;; (require 'init-gui)
(require 'init-misc)
(require 'init-cscope)
(require 'init-eshell)
;; (require 'init-hippie-expand)
;; (require 'init-auto-complete)

;; (require 'init-windows)
;; (require 'init-sessions)
;; (require 'init-mmm)
;; (require 'init-tabbar)
(require 'init-editing-utils)
;; (require 'init-evil)
;; (require 'init-matlab)

;; (require 'init-vc)
;; (require 'init-darcs)

;; (require 'init-crontab)
;; (require 'init-textile)
(require 'init-markdown)
;; (require 'init-auctex)
;; (require 'init-csv)
;; (require 'init-erlang)
;; (require 'init-javascript)
;; (require 'init-php)
;; (require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
;;;; (require 'init-haskell)
;; (require 'init-ruby-mode)
;; (require 'init-rails)
;; (require 'init-sql)

;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)
;; (require 'init-clojure)
;; (when (>= emacs-major-version 24)
;;   (require 'init-clojure-cider))
;; (require 'init-common-lisp)

;; (require 'init-marmalade)
;; (require 'init-misc)

;; (require 'init-dash)
;; (require 'init-ledger)
;; ;; Extra packages which don't require any configuration

;; (require-package 'gnuplot)
;; (require-package 'lua-mode)
;; (require-package 'htmlize)
;; (require-package 'dsvn)
;; (require-package 'regex-tool)

;; ;;----------------------------------------------------------------------------
;; ;; Allow access from emacsclient
;; ;;----------------------------------------------------------------------------
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
(require 'init-local nil t)


;; ;;----------------------------------------------------------------------------
;; ;; Locales (setting them earlier in this file doesn't work in X)
;; ;;----------------------------------------------------------------------------
;; (require 'init-locales)

;; (add-hook 'after-init-hook
;;            (lambda ()
;;              (message "init completed in %.2fms"
;;                       (sanityinc/time-subtract-millis after-init-time before-init-time))))

;; (require 'init-clips)
(require 'init-ccmode)
;; (require 'init-hooks)
(require 'init-fonts)
(require 'init-themes)
(require 'init-yasnippet)

(global-set-key "\C-c\ f" 'counsel-recentf)

;; Auto add HEADER in new file
(add-hook 'find-file-hook
          '(lambda ()
             (when (and (buffer-file-name)
                        (not (file-exists-p (buffer-file-name)))
                        (= (point-max) 1))
               (let ((header-snippet "HEADER")
                     (yas/fallback-behavior 'return-nil))
                 (insert header-snippet)
                 ;; if can't expand snippet, delete insert string
                 (if (not (yas/expand))
                     (delete-region (point-min) (point-max)))))))


(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))

(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)


;; ;; 打开 org-indent mode
;; (setq org-startup-indented t)
;; ;; 设置 bullet list
;; (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

;; (global-set-key (kbd "C-x 0") 'sticky-window-delete-window)

(setq gdb-display-io-nopopup t)

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))


(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
)  

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp)

(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

(use-package pyvenv
  :after python-mode
  :config
  (pyvenv-mode 1))

;; (use-package vterm
;;     :ensure t
;;     :pin melpa
;;     :bind (:map vterm-mode-map ("C-y" . vterm-yank))
;;     :config (setq vterm-max-scrollback 100000))

;; (use-package vterm
;;   :ensure t
;;   :pin melpa
;;   :commands vterm
;;   :bind (:map vterm-mode-map ("C-y" . vterm-yank))
;;   ;; :bind (:map vterm-mode-map ("<C-return>" . vterm-toggle-insert-cd))
;;   :config
;;   (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
;;   (setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
;;   (setq vterm-max-scrollback 10000))

;;; Terminal
(use-package vterm
  :when (memq window-system '(mac ns x pgtk))
  :bind (:map vterm-mode-map
              ("C-y" . vterm-yank)
              ("M-y" . vterm-yank-pop)
              ("C-k" . vterm-send-C-k-and-kill))
  :init
  (setq vterm-shell "zsh")
  :config
  (setq vterm-max-scrollback 10000)
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
  (setq vterm-always-compile-module t)
  (defun vterm-send-C-k-and-kill ()
    "Send `C-k' to libvterm, and put content in kill-ring."
    (interactive)
    (kill-ring-save (point) (vterm-end-of-line))
    (vterm-send-key "k" nil nil t)))

;; (use-package vterm-toggle
;;   :when (memq window-system '(mac ns x pgtk))
;;   :bind (([f2] . vterm-toggle)
;;          ([f9] . vterm-compile)
;;          :map vterm-mode-map
;;          ([f2] . vterm-toggle)
;;          ([(control return)] . vterm-toggle-insert-cd)))

(use-package vterm-toggle
  :when (memq window-system '(mac ns x pgtk))
  :bind (([f2] . vterm-toggle)
         ([f5] . vterm-compile)
         :map vterm-mode-map
         ([f2] . vterm-toggle)
         ([(control return)] . vterm-toggle-insert-cd))
  :config
  (setq vterm-toggle-cd-auto-create-buffer nil)
  (defvar vterm-compile-buffer nil)
  (defun vterm-compile ()
    "Compile the program including the current buffer in `vterm'."
    (interactive)
    (setq compile-command (compilation-read-command compile-command))
    (let ((vterm-toggle-use-dedicated-buffer t)
          (vterm-toggle--vterm-dedicated-buffer (if (vterm-toggle--get-window)
                                                    (vterm-toggle-hide)
                                                  vterm-compile-buffer)))
      (with-current-buffer (vterm-toggle-cd)
        (setq vterm-compile-buffer (current-buffer))
        (rename-buffer "*vterm compilation*")
        (compilation-shell-minor-mode 1)
        (vterm-send-M-w)
        (vterm-send-string compile-command t)
        (vterm-send-return)))))


;; (use-package multi-vterm :ensure t)

;; (global-set-key [S-f2] 'vterm-toggle)
;; (global-set-key [f2] 'vterm-toggle-cd)

;; you can cd to the directory where your previous buffer file exists
;; after you have toggle to the vterm buffer with `vterm-toggle'.
;; (define-key vterm-mode-map (kbd "<C-return>") 'vterm-toggle-insert-cd)

;Switch to next vterm buffer
;; (define-key vterm-mode-map (kbd "s-n")   'vterm-toggle-forward)
;Switch to previous vterm buffer
;; (define-key vterm-mode-map (kbd "s-p")   'vterm-toggle-backward)

;; (defun my-compilation-hook ()
;;   (when (not (get-buffer-window "*compilation*"))
;;     (save-selected-window
;;       (save-excursion
;;         (let* ((w (split-window-vertically))
;;                (h (window-height w)))
;;           (select-window w)
;;           (switch-to-buffer "*compilation*")
;;           (shrink-window (- h compilation-window-height)))))))
;; (add-hook 'compilation-mode-hook 'my-compilation-hook)

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook (function misc:underscore-word-hook))


(setq jedi:complete-on-dot t)

(when (functionp 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))

(setq lsp-enable-symbol-highlighting nil)

(defun resize-window (&optional arg)    ; Hirose Yuuji and Bob Wiener
  "*Resize window interactively."
  (interactive "p")
  (if (one-window-p) (error "Cannot resize sole window"))
  (or arg (setq arg 1))
  (let (c)
    (catch 'done
      (while t
	(message
	 "h=heighten, s=shrink, w=widen, n=narrow (by %d);  1-9=unit, q=quit"
	 arg)
	(setq c (read-char))
	(condition-case ()
	    (cond
	     ((= c ?h) (enlarge-window arg))
	     ((= c ?s) (shrink-window arg))
	     ((= c ?w) (enlarge-window-horizontally arg))
	     ((= c ?n) (shrink-window-horizontally arg))
	     ((= c ?\^G) (keyboard-quit))
	     ((= c ?q) (throw 'done t))
	     ((and (> c ?0) (<= c ?9)) (setq arg (- c ?0)))
             (t (throw 'done t)))
	  (error (beep)))))
    (message "Done.")))

(global-set-key "\C-ce"  (lambda () (interactive) (resize-window 4)))


(defun electric-pair ()
      "If at end of line, insert character pair without surrounding spaces.
    Otherwise, just insert the typed character."
      (interactive)
      (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))

(add-hook 'python-mode-hook
              (lambda ()
                (define-key python-mode-map "\"" 'electric-pair)
                (define-key python-mode-map "\'" 'electric-pair)
                (define-key python-mode-map "(" 'electric-pair)
                (define-key python-mode-map "[" 'electric-pair)
                (define-key python-mode-map "{" 'electric-pair)))

(add-hook 'c++-mode-hook
              (lambda ()
                (define-key c++-mode-map "\"" 'electric-pair)
                (define-key c++-mode-map "\'" 'electric-pair)
                (define-key c++-mode-map "(" 'electric-pair)
                (define-key c++-mode-map "[" 'electric-pair)
                (define-key c++-mode-map "{" 'electric-pair)))

(setq electric-pair-mode t)

(provide 'init)

