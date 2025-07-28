;;; init-vertico.el --- Modern minibuffer completion system

;; Dependencies: straight.el
;; This file sets up Vertico + Orderless + Marginalia + Consult

;;; Commentary:
;; This configuration replaces Ivy with a more modular and modern stack:
;; - Vertico: simple vertical completion UI
;; - Orderless: powerful flexible matching style
;; - Marginalia: annotations in minibuffer
;; - Consult: powerful command replacements for buffer, line, file, etc.

;;; Code:

;; Enable vertico (completion UI)
(use-package vertico
  :init
  (vertico-mode)
  :config
  (setq vertico-cycle t))  ;; optional: cycle around when reaching top/bottom

;; Persist minibuffer history
(use-package savehist
  :init
  (savehist-mode))

;; Orderless completion style
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion)))))
  :config
  (setq orderless-matching-styles '(orderless-literal orderless-regexp)))

;; Marginalia: add helpful annotations
(use-package marginalia
  :after vertico
  :init
  (marginalia-mode))

;; Consult: modern replacement commands
(use-package consult
  :bind (
         ;; ("C-s"       . consult-line)
         ("C-r"       . consult-history)
         ("C-x b"     . consult-buffer)
         ("C-x C-r"   . consult-recent-file)
         ("M-y"       . consult-yank-pop)
         ("M-g g"     . consult-goto-line)
         ("M-g i"     . consult-imenu)
         ("C-c h"     . consult-history)))

(defun my-consult-line-at-point ()
  "Consult-line with the symbol/word at point as initial input."
  (interactive)
  (consult-line (thing-at-point 'symbol t)))

(global-set-key (kbd "C-s") #'my-consult-line-at-point)

(provide 'init-vertico)
;;; init-vertico.el ends here
