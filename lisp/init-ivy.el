(require 'package)
(require 'cl-lib)

;;
;; set autosave and backup directory
;;
(defconst emacs-tmp-dir (format "%s%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix emacs-tmp-dir)

;;
;; custome variable path
;;
(setq custom-file (expand-file-name "custom-variables.el" user-emacs-directory))

(when (file-exists-p custom-file)
    (load custom-file))

;;
;; use use-package
;;
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package diminish :ensure t)
(use-package bind-key :ensure t)

;; (use-package auto-package-update
;;   :ensure t
;;   :config
;;   (setq auto-package-update-delete-old-versions t)
;;   (setq auto-package-update-hide-results t)
;;   (auto-package-update-maybe))

;;
;; basic setup
;;
(menu-bar-mode -1)
(show-paren-mode t)

;; (setq electric-pair-pairs '(
;; 			    (?\' . ?\')
;; 			    ))


(setq-default indent-tabs-mode nil)

(winner-mode t)

;;
;; hideshow
;;
(add-hook 'prog-mode-hook #'hs-minor-mode)

;;
;; multiple cursors
;;
(use-package multiple-cursors
  :ensure t
  :bind (
         ("M-3" . mc/mark-next-like-this)
         ("M-4" . mc/mark-previous-like-this)
         :map ctl-x-map
         ("\C-m" . mc/mark-all-dwim)
         ("<return>" . mule-keymap)
         ))

;;
;; ivy mode
;;
(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 8)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-count-format "%d/%d")
  (setq ivy-re-builders-alist
        '(
          (swiper . ivy--regex-plus)
          (swiper-isearch . ivy--regex-plus)
          (counsel-grep . ivy--regex-plus)
          (t . ivy--regex-fuzzy)
          )))


;; Make the last used command be the first-one
(use-package ivy-prescient
  :init
  (ivy-prescient-mode 1))

;;
;; swiper
;;
(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key (kbd "C-s") 'swiper-isearch)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    ;; (global-set-key (kbd "M-y") 'counsel-yank-pop)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "<f2> j") 'counsel-set-variable)
    (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
    (global-set-key (kbd "C-c v") 'ivy-push-view)
    (global-set-key (kbd "C-c V") 'ivy-pop-view)


    ;; (global-set-key "\C-s" 'swiper-isearch)
    ;; ; (global-set-key "\C-s" 'swiper-isearch-thing-at-point)
    ;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
    ;; (global-set-key (kbd "<f6>") 'ivy-resume)
    ;; (global-set-key (kbd "M-x") 'counsel-M-x)
    ;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    ;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    ;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    ;; (global-set-key (kbd "<f1> l") 'counsel-load-library)
    ;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    ;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    ;; (global-set-key (kbd "C-c g") 'counsel-git)
    ;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
    ;; (global-set-key (kbd "C-c k") 'counsel-ag)
    ;; (global-set-key (kbd "C-x l") 'counsel-locate)
    ;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; it looks like counsel is a requirement for swiper
(use-package counsel
  :ensure t
  )

;; (global-set-key "\C-c\ f" 'counsel-recentf)

;;
;; yasnippet
;;
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode)
  (use-package yasnippet-snippets :ensure t)
  )

;; http://blog.binchen.org/posts/use-ivy-to-open-recent-directories.html
;; https://emacs-china.org/t/topic/5948/3?u=et2010
(defvar counsel-recent-dir--selected "~/")

(defvar counsel-recent-dir--map (let ((map (make-sparse-keymap)))
                                  (define-key map  (kbd "TAB") 'counsel-recent-dir--find-file)
                                  (define-key map  [(tab)] 'counsel-recent-dir--find-file)
                                  map))

(defun counsel-recent-dir--find-file()
  (interactive)
  (ivy-exit-with-action
   (lambda(c)
     (setq counsel-recent-dir--selected c)
     (run-at-time 0.05 nil (lambda()
                             (let ((default-directory counsel-recent-dir--selected))
                               ;; (find-file counsel-recent-dir--selected)
                               (counsel-find-file)))))))

(defun counsel-recent-directory ()
  "Open recent directory with dired"
  (interactive)
  (unless recentf-mode (recentf-mode 1))
  (let ((collection
         (delete-dups
          (append (mapcar 'file-name-directory recentf-list)
                  ;; fasd history
                  (if (executable-find "fasd")
                      (split-string (shell-command-to-string "fasd -ld") "\n" t))))))
    (ivy-read "directories:" collection
              :keymap counsel-recent-dir--map
              :action (lambda (x) (if (fboundp 'ranger) (ranger x) (dired x))))))

(defun xah-search-current-word ()
  "Call 'isearch' on current word or text selection.
“word” here is A to Z, a to z, and hyphen 「-」 and underline 「_」, independent of syntax table.
URL 'http://ergoemacs.org/emacs/modernization_isearch.html'
Version 2015-04-09"
  (interactive)
  (let ( $p1 $p2 )
    (if (use-region-p)
        (progn
          (setq $p1 (region-beginning))
          (setq $p2 (region-end)))
      (save-excursion
        (skip-chars-backward "-_A-Za-z0-9")
        (setq $p1 (point))
        (right-char)
        (skip-chars-forward "-_A-Za-z0-9")
        (setq $p2 (point))))
    (setq mark-active nil)
    (when (< $p1 (point))
      (goto-char $p1))
    (isearch-mode t)
    (isearch-yank-string (buffer-substring-no-properties $p1 $p2))))

;; (global-set-key "\C-s" 'xah-search-current-word)
;; (global-set-key "\C-s" 'isearch-forward)

;; version of ivy-yank-word to yank from start of word
(defun bjm/ivy-yank-whole-word ()
  "Pull next word from buffer into search string."
  (interactive)
  (let (amend)
    (with-ivy-window
      ;;move to last word boundary
      (re-search-backward "\\b")
      (let ((pt (point))
            (le (line-end-position)))
        (forward-word 1)
        (if (> (point) le)
            (goto-char pt)
          (setq amend (buffer-substring-no-properties pt (point))))))
    (when amend
      (insert (replace-regexp-in-string "  +" " " amend)))))

;; bind it to M-j
(define-key ivy-minibuffer-map (kbd "C-w") 'bjm/ivy-yank-whole-word)

(require 'ivy-avy)
(require 'ivy_buffer_extend)


(defun my/ivy-edit-path-from-root ()
  "Restart `counsel-find-file` with empty input and root directory."
  (interactive)
  (let ((default-directory "/"))  ;; or "~/" for home
    (ivy-quit-and-run
      (counsel-find-file ""))))

(define-key ivy-minibuffer-map (kbd "C-e") #'my/ivy-edit-path-from-root)

(provide 'init-ivy)
