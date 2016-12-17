;; (global-set-key (kbd "M-/") 'hippie-expand)
;; (autoload 'senator-try-expand-semantic "senator")

;;--------------------------------------------------------------------
(setq hippie-expand-try-functions-list 
      '(
		senator-try-expand-semantic
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-expand-whole-kill
        try-expand-line-all-buffers
        ))

(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
 	  (hippie-expand nil)
     (indent-for-tab-command nil))
 )

(provide 'init-hippie-expand)
