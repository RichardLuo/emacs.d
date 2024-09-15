(use-package projectile
  :ensure t
  :config
  ;; 启用 projectile 模式
  (projectile-mode +1)
  ;; 设置全局忽略目录和文件
  (add-to-list 'projectile-globally-ignored-directories ".ccls-cache")
  (add-to-list 'projectile-globally-ignored-files "*.log")
  (add-to-list 'projectile-globally-ignored-files "*.tmp")
  (add-to-list 'projectile-globally-ignored-files "*.o")
  (add-to-list 'projectile-globally-ignored-files "*.bin")
  (add-to-list 'projectile-globally-ignored-files "*.obj")
  ;; 设置快捷键前缀（可选）
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(provide 'init-projectile)
