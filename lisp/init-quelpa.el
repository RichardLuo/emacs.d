;; 仅当 quelpa 未安装时才安装它
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

;; 使用 unless 检查 quelpa-use-package 是否已安装，若未安装则安装之
(unless (package-installed-p 'quelpa-use-package)
  (quelpa
   '(quelpa-use-package
     :fetcher git
     :url "https://github.com/quelpa/quelpa-use-package.git")))

(require 'quelpa-use-package)

;; 禁用自动更新 MELPA 源和 Quelpa
(setq quelpa-update-melpa-p nil)  ; 不从 MELPA 更新包，只用 Quelpa 管理的源
(setq quelpa-self-upgrade-p nil)  ; 禁用自动更新 Quelpa

(provide 'init-quelpa)
