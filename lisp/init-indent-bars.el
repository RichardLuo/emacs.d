;; (use-package indent-bars
;;   :straight (indent-bars :type git :host github :repo "jdtsmith/indent-bars")
;;   :hook (prog-mode . indent-bars-mode)
;;   :custom
;;   (indent-bars-treesit-support t)
;;   (indent-bars-no-descend-string t)
;;   (indent-bars-treesit-ignore-blank-lines-types '("module"))
;;   (indent-bars-prefer-character t)
;;   (indent-bars-treesit-wrap
;;    '((python
;; 	  argument_list
;; 	  parameters ; for python, as an example
;; 	  list
;; 	  list_comprehension
;; 	  dictionary
;; 	  dictionary_comprehension
;; 	  parenthesized_expression
;; 	  subscript)))
;;   (indent-bars-no-stipple-char ?\⎸)
;;   )

(use-package indent-bars
  ;; :disabled ;; will cause lsp rust stuck after insert `std::'
  :straight (indent-bars :type git :host github :repo "jdtsmith/indent-bars")
  :hook (prog-mode . indent-bars-mode)
  :custom-face
  (indent-bars-face ((t (:height 1.08))))
  :custom
  (indent-bars-treesit-support t)
  (indent-bars-no-descend-string t)
  (indent-bars-treesit-ignore-blank-lines-types '("module"))
  (indent-bars-prefer-character t)
  (indent-bars-treesit-wrap
   '((python
	  argument_list
	  parameters ; for python, as an example
	  list
	  list_comprehension
	  dictionary
	  dictionary_comprehension
	  parenthesized_expression
	  subscript)))
  (indent-bars-no-stipple-char ?\⎸)
  )

(provide 'init-indent-bars)
