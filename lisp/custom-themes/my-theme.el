(defun my-theme ()
  "Color theme by Nelson Loyola, created 2002-04-15.
Includes cperl, custom, font-lock, p4, speedbar, widget."
  (interactive)
  (color-theme-install
   '(color-theme-blue-mood
     ((background-color . "DodgerBlue4")
      (background-mode . dark)
      (background-toolbar-color . "#bfbfbfbfbfbf")
      (border-color . "Blue")
      (border-color . "#000000000000")
      (bottom-toolbar-shadow-color . "#6c6c68686868")
      (cursor-color . "DarkGoldenrod1")
      (foreground-color . "white smoke")
      (mouse-color . "black")
      (top-toolbar-shadow-color . "#e5e5e0e0e1e1"))
     ((vc-annotate-very-old-color . "#0046FF"))
     (default ((t (nil))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (nil))))
     (border-glyph ((t (nil))))
     (cmode-bracket-face ((t (:bold t))))
     (cperl-array-face ((t (:bold t :foreground "wheat"))))
     (cperl-hash-face ((t (:bold t :foreground "chartreuse"))))
     (custom-button-face ((t (nil))))
     (custom-changed-face ((t (:background "blue" :foreground "white"))))
     (custom-documentation-face ((t (nil))))
     (custom-face-tag-face ((t (:underline t))))
     (custom-group-tag-face ((t (:underline t :foreground "blue"))))
     (custom-group-tag-face-1 ((t (:underline t :foreground "red"))))
     (custom-invalid-face ((t (:background "red" :foreground "yellow"))))
     (custom-modified-face ((t (:background "blue" :foreground "white"))))
     (custom-rogue-face ((t (:background "black" :foreground "pink"))))
     (custom-saved-face ((t (:underline t))))
     (custom-set-face ((t (:background "white" :foreground "blue"))))
     (custom-state-face ((t (:bold t :foreground "cyan"))))
     (custom-variable-button-face ((t (:underline t :bold t))))
     (custom-variable-tag-face ((t (:underline t :foreground "blue"))))
     (ff-paths-non-existant-file-face ((t (:bold t :foreground "NavyBlue"))))

     (font-lock-builtin-face ((t (:regular t :foreground "wheat"))))
     (font-lock-comment-face ((t (:regular t :foreground "gray72"))))
     (font-lock-constant-face ((t (:regular t :foreground "cyan3"))))

;;;      (font-lock-builtin-face ((t (:bold t :foreground "wheat"))))
;;;      (font-lock-comment-face ((t (:regular t :foreground "gray72"))))
;;;      (font-lock-constant-face ((t (:bold t :foreground "cyan3"))))

     (font-lock-function-name-face ((t (:bold t :foreground "chartreuse"))))

     (font-lock-doc-string-face ((t (:foreground "#00C000"))))
     (font-lock-keyword-face ((t (:bold t :foreground "gold1"))))
     (font-lock-other-emphasized-face ((t (:bold t :foreground "gold1"))))
     (font-lock-other-type-face ((t (:bold t :foreground "gold1"))))
     (font-lock-preprocessor-face ((t (:foreground "plum"))))
     (font-lock-reference-face ((t (:bold t :foreground "orangered"))))
     (font-lock-string-face ((t (:foreground "tomato"))))
     (font-lock-type-face ((t (:bold t :foreground "gold1"))))
     (font-lock-variable-name-face ((t (:foreground "light yellow"))))
     (font-lock-warning-face ((t (:foreground "tomato"))))
     (green ((t (:foreground "green"))))
     (gui-button-face ((t (:background "grey75" :foreground "black"))))
     (gui-element ((t (:size "nil" :background "#e7e3d6" :foreground" #000000"))))
     (highlight ((t (:background "red" :foreground "yellow"))))
     (isearch ((t (:bold t :background "pale turquoise" :foreground "blue"))))
     (italic ((t (nil))))
     (lazy-highlight-face ((t (:bold t :foreground "dark magenta"))))
     (left-margin ((t (nil))))
     (list-mode-item-selected ((t (:bold t :background "gray68" :foreground "yellow"))))
     (modeline ((t (:background "goldenrod" :foreground "darkblue"))))
     (modeline-buffer-id ((t (:background "goldenrod" :foreground "darkblue"))))
     (modeline-mousable ((t (:background "goldenrod" :foreground "darkblue"))))
     (modeline-mousable-minor-mode ((t (:background "goldenrod" :foreground "darkblue"))))
     (my-tab-face ((t (:background "SlateBlue1"))))
     (p4-depot-added-face ((t (:foreground "steelblue1"))))
     (p4-depot-deleted-face ((t (:foreground "red"))))
     (p4-depot-unmapped-face ((t (:foreground "grey90"))))
     (p4-diff-change-face ((t (:foreground "dark green"))))
     (p4-diff-del-face ((t (:bold t :foreground "salmon"))))
     (p4-diff-file-face ((t (:background "blue"))))
     (p4-diff-head-face ((t (:background "blue"))))
     (p4-diff-ins-face ((t (:foreground "steelblue1"))))
     (paren-blink-off ((t (:foreground "DodgerBlue4"))))
     (paren-match ((t (:background "red" :foreground "yellow"))))
     (paren-mismatch ((t (:background "DeepPink"))))
     (pointer ((t (:background "white"))))
     (primary-selection ((t (:bold t :background "medium sea green"))))
     (red ((t (:foreground "red"))))
     (region ((t (:background "red" :foreground "yellow"))))
     (right-margin ((t (nil))))
     (secondary-selection ((t (:background "gray91" :foreground "sienna3"))))
     (show-paren-match-face ((t (:background "cyan3" :foreground "blue"))))
     (show-paren-mismatch-face ((t (:background "red" :foreground "blue"))))
     (show-trailing-whitespace ((t (:background "red" :foreground "blue"))))
     (speedbar-button-face ((t (:foreground "white"))))
     (speedbar-directory-face ((t (:foreground "gray"))))
     (speedbar-file-face ((t (:foreground "gold1"))))
     (speedbar-highlight-face ((t (:background "lightslateblue" :foreground "gold1"))))
     (speedbar-selected-face ((t (:underline t :foreground "red"))))
     (speedbar-tag-face ((t (:foreground "chartreuse"))))
     (text-cursor ((t (:background "DarkGoldenrod1" :foreground "DodgerBlue4"))))
     (toolbar ((t (:background "#e7e3d6" :foreground "#000000"))))
     (underline ((t (:underline t))))
     (vertical-divider ((t (:background "#e7e3d6" :foreground "#000000"))))
     (widget-button-face ((t (:bold t))))
     (widget-button-pressed-face ((t (:foreground "red"))))
     (widget-documentation-face ((t (:foreground "dark green"))))
     (widget-field-face ((t (:background "gray85"))))
     (widget-inactive-face ((t (:foreground "dim gray"))))
     (widget-single-line-field-face ((t (:background "gray85"))))
     (yellow ((t (:foreground "yellow"))))
     (zmacs-region ((t (:background "white" :foreground "midnightblue")))))))



;; (defun my-theme ()
;;   (interactive)
;;   (color-theme-install
;;    '(my-theme
;;      ((background-color . "#101e2e")
;;       (background-mode . light)
;;       (border-color . "#1a1a1a")
;;       (cursor-color . "#fce94f")
;;       (foreground-color . "#eeeeec")
;;       (mouse-color . "black"))
;;      (fringe ((t (:background "#1a1a1a"))))
;;      (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
;;      (region ((t (:background "#0d4519"))))
;;      (font-lock-builtin-face ((t (:foreground "#729fcf"))))
;;      (font-lock-comment-face ((t (:foreground "#888a85"))))
;;      (font-lock-function-name-face ((t (:foreground "#edd400"))))
;;      (font-lock-keyword-face ((t (:foreground "#729fcf"))))
;;      (font-lock-string-face ((t (:foreground "#ad7fa8"))))
;;      (font-lock-type-face ((t (:foreground "#8ae234"))))
;;      (font-lock-constant-face ((t (:foreground "#e6a00f"))))
;;      (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
;;      (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
;;      (font-lock-warning-face ((t (:foreground "red" :bold t)))))))

(provide 'my-theme)
