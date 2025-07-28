(use-package imenu-list
  :straight (imenu-list :type git :host github :repo "bmag/imenu-list")
  :bind ("C-c i" . imenu-list-smart-toggle) ; 设置快捷键 C-c i 打开/关闭 imenu-list
  :init
  (setq imenu-list-size 30                  ; 设置窗口宽度为 30
        imenu-list-auto-resize t            ; 自动调整窗口大小
        imenu-list-focus-after-activation t ; 打开时自动聚焦
        imenu-list-auto-update t)           ; 光标移动时自动更新
  :hook (dart-mode . imenu-list-smart-toggle)) ; 打开 Dart 文件时自动开启 imenu-list

(provide 'init-imenu-list)
