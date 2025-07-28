(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'fill       ;; 使用背景块显示缩进
        highlight-indent-guides-responsive 'top    ;; 响应式高亮当前缩进级别
        highlight-indent-guides-delay 0.1)
  (set-face-background 'highlight-indent-guides-odd-face "#303030")  ;; 设置奇数缩进背景色
  (set-face-background 'highlight-indent-guides-even-face "#404040")) ;; 设置偶数缩进背景色



(provide 'init-highlight-indent-guides)
