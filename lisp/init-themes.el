(when (eq system-type 'darwin) ;; mac specific settings
  ;; (set-frame-font "Roboto Mono-18" nil t)
  ;; (set-face-attribute 'default nil :font "Roboto Mono-17" :weight 'light)
  ;; (set-face-attribute 'default nil
  ;;                     :family "JetBrainsMono Nerd Font Mono"
  ;;                     :height 170
  ;;                     :weight 'ital)

  (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono-19" :weight 'semi-light)
  ;; (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono-17" :weight 'Regular)

  ;; (set-face-attribute 'default nil :font "SF Mono-20" :weight 'light)
  ;; (setq default-frame-alist nil)

  (use-package doom-themes
    :init (load-theme 'doom-palenight t))
  )

(when (eq system-type 'gnu/linux) ;; mac specific settings
  (set-frame-font "Monaco-25")
  (set-face-attribute 'default nil :font "Monaco-25")
  (setq default-frame-alist nil)
  (use-package doom-themes
    :init (load-theme 'doom-palenight t)))

(defun adjust-frame-size-and-position ()
  "Adjust the frame size and position to take up the left three-quarters of the screen."
  (when (display-graphic-p)  ; 确保在图形界面模式下运行
    ;; 确定窗口顶部和左侧的边距，以适应系统菜单栏
    (add-to-list 'default-frame-alist 
                 (cons 'top (/ (x-display-pixel-height) 60)))   ; 留出一些空间以适应顶部状态栏
    (add-to-list 'default-frame-alist 
                 (cons 'left (/ (x-display-pixel-width) 50)))   ; 留出一些空间在屏幕左侧

    ;; 设置窗口的高度和宽度，以适应屏幕尺寸
    (add-to-list 'default-frame-alist 
                 (cons 'height (/ (* 49 (x-display-pixel-height)) 
                                  (* 50 (frame-char-height))))) ; 计算高度，适应字符高度
    (add-to-list 'default-frame-alist 
                 (cons 'width (/ (* 3 (x-display-pixel-width))
                                 (* 7 (frame-char-width)))))    ; 占据屏幕宽度的四分之三
    (message "Frame adjusted to top %d, left %d, height %d, width %d"
             (/ (x-display-pixel-height) 50)
             (/ (x-display-pixel-width) 20)
             (/ (* 49 (x-display-pixel-height)) (* 50 (frame-char-height)))
             (/ (* 3 (x-display-pixel-width)) (* 4 (frame-char-width))))
    ))

;; 在启动时调用函数设置窗口大小和位置
(add-hook 'emacs-startup-hook 'adjust-frame-size-and-position)

(provide 'init-themes)

