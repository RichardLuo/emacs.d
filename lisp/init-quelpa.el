;; 初始化包管理系统并添加 MELPA 源
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)  ;; 只初始化已安装包，不联网

;; ❗首次安装时启用以下几行，然后注释掉
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; ❗首次安装 quelpa 时启用以下几段，安装成功后注释掉，避免 Emacs 启动时自动联网
;; (unless (package-installed-p 'quelpa)
;;   (package-refresh-contents)
;;   (package-install 'quelpa))
;; (unless (package-installed-p 'quelpa-use-package)
;;   (package-refresh-contents)
;;   (package-install 'quelpa-use-package))

;; ;; 安全加载 quelpa，避免未安装时报错
;; (when (not (and (require 'quelpa nil t)
;;                 (require 'quelpa-use-package nil t)))
;;   (message "Warning: 'quelpa' or 'quelpa-use-package' is not installed."))

;; ;; 禁用自动更新 MELPA 源和 Quelpa
;; (setq quelpa-update-melpa-p nil)  ; 不从 MELPA 更新包，只用 Quelpa 管理的源
;; (setq quelpa-self-upgrade-p nil)  ; 禁用自动更新 Quelpa

(provide 'init-quelpa)
