;; 初始化包管理系统并添加 MELPA 源
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(unless package-archive-contents
  (package-refresh-contents))

;; 安装 quelpa 和 quelpa-use-package
(unless (package-installed-p 'quelpa)
  (package-refresh-contents)
  (package-install 'quelpa))
(unless (package-installed-p 'quelpa-use-package)
  (package-refresh-contents)
  (package-install 'quelpa-use-package))

(require 'quelpa)
(require 'quelpa-use-package)

;; 禁用自动更新 MELPA 源和 Quelpa
(setq quelpa-update-melpa-p nil)  ; 不从 MELPA 更新包，只用 Quelpa 管理的源
(setq quelpa-self-upgrade-p nil)  ; 禁用自动更新 Quelpa

(provide 'init-quelpa)
