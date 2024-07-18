(require 'ascope)

;; 自定义 ascope 的分隔线样式
(defun my-ascope-customize-buffer ()
  "Customize the appearance of the ascope buffer."
  (message "my-ascope-customize-buffer called")
  (when (string-match-p "^\\*ascope\\*" (buffer-name))
    (message "Inside ascope buffer")
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "^=+$" nil t)
        (message "Found separator line at %d" (point))
        (replace-match (make-string (window-width) ?─) nil nil)))))

;; 添加自定义函数到 ascope buffer 更新的 hook
(add-hook 'ascope-minor-mode-hook
          (lambda ()
            (advice-add 'ascope:display-results :after #'my-ascope-customize-buffer)))

;; 自动启用 ascope 模式
(add-hook 'c-mode-common-hook 'ascope-minor-mode)

;; ;; 设置键绑定（可选）
;; (eval-after-load 'ascope
;;   '(progn
;;      (define-key ascope-minor-mode-keymap (kbd "M-.") 'ascope-find-global-definition)
;;      (define-key ascope-minor-mode-keymap (kbd "M-,") 'ascope-pop-mark)))

;; 配置使用 gtags-ascope 代替 ascope
(setq ascope-program "gtags-cscope")

;; 自动启用 ascope 模式
(add-hook 'c-mode-common-hook 'ascope-minor-mode)

;; ;; 设置键绑定（可选）
;; (eval-after-load 'ascope
;;   '(progn
;;      (define-key ascope-minor-mode-keymap (kbd "M-.") 'ascope-find-global-definition)
;;      (define-key ascope-minor-mode-keymap (kbd "M-,") 'ascope-pop-mark)))

;; told emacs do not update database evey time.
(setq ascope-do-not-update-database t)
(setq ascope-use-relative-paths t)

(define-key global-map [(s b)] 'ascope-display-buffer) ;s show
(define-key global-map [(s s)] 'ascope-find-this-symbol) ;C-c s s
(define-key global-map [(s p)] 'ascope-pop-mark)       ;p pop
(define-key global-map [(s d)] 'ascope-find-global-definition)
(define-key global-map [(s e)] 'ascope-find-egrep-pattern)
(define-key global-map [(s j)] 'ascope-find-global-definition-no-prompting)
(define-key global-map [(s i)] 'ascope-index-files)
(define-key global-map [(s I)] 'ascope-set-initial-directory)
(define-key global-map [(s P)] 'ascope-prev-symbol)
(define-key global-map [(s N)] 'ascope-next-symbol)
(define-key global-map [(s f)] 'ascope-find-this-file)
(define-key global-map [(s c)] 'ascope-find-functions-calling-this-function)


(defface my-ascope-separator-face
  '((t (:weight bold :foreground "red")))
  "Face for ascope result separator.")

(defun my-ascope-insert-separator ()
  "Insert a ascope result separator with the specified face."
  (let ((separator (propertize "===============================================================================\n" 'face 'my-ascope-separator-face)))
    (insert separator)))

(defun my-ascope-advice ()
  "Advice function to insert custom separator."
  (when (and (boundp 'ascope-output-buffer-name)
             (get-buffer ascope-output-buffer-name))
    (with-current-buffer (get-buffer ascope-output-buffer-name)
      (goto-char (point-min))
      (unless (boundp 'ascope-rerunning-search)
        (delete-region (point-min) (point-max)))
      (when (not (bolp))
        (insert "\n"))
      (my-ascope-insert-separator))))

(advice-add 'ascope-call :after 'my-ascope-advice)

(setq 
 ascope-database-regexps 
'(
   ( "^/home/richard/ddbs"
     ( "/home/richard/ddbs/frameworks" )
     ( "/home/richard/ddbs/bionic" )
     ( "/home/richard/ddbs/build" )
     ( "/home/richard/ddbs/system" )
     ( "/home/richard/ddbs/external" )
     )

   ( "^/media/psf/share/sillicon/znet-v2.5"
     ( "/media/psf/share/sillicon/znet-v2.5" )
     )

   ( "^/media/psf/share/xyan-znet-sdk/v3.1"
     ( "/media/psf/share/xyan-znet-sdk/v3.1/protocol/zigbee/" )
     ( "/media/psf/share/xyan-znet-sdk/v3.1/platform/base/" )
     ( "/media/psf/share/xyan-znet-sdk/v3.1/util/" )
     ( "/media/psf/share/xyan-znet-sdk/v3.1/platform/emdrv/" )
     ( "/media/psf/share/xyan-znet-sdk/v3.1/platform/service/" )
     ( "/media/psf/share/xyan-znet-sdk/v3.1/platform/common/" )
     )

   ( "^/media/psf/share/xyan-znet-sdk/cpc-daemon"
     ( "/media/psf/share/xyan-znet-sdk/cpc-daemon/" )
     ( "/media/psf/share/xyan-znet-sdk/gsdk/util/third_party/openthread/" )
     ( "/media/psf/share/xyan-znet-sdk/gsdk/protocol/zigbee/" )
     )

     ( "^/media/psf/share/xyan-znet-sdk/gsdk/util/third_party/openthread"
       ( "/media/psf/share/xyan-znet-sdk/cpc-daemon/" )
       ( "/media/psf/share/xyan-znet-sdk/gsdk/util/third_party/openthread/" )
       ( "/media/psf/share/xyan-znet-sdk/gsdk/protocol/zigbee/" )
       )

     ( "^/media/psf/share/xyan-znet-sdk/gsdk/protocol/zigbee"
       ( "/media/psf/share/xyan-znet-sdk/cpc-daemon/" )
       ( "/media/psf/share/xyan-znet-sdk/gsdk/util/third_party/openthread/" )
       ( "/media/psf/share/xyan-znet-sdk/gsdk/protocol/zigbee/" )
       )

     ( "^/home/richard/ncs/"
       ("/home/richard/ncs")
       ( "/home/richard/.local/opt/zephyr-sdk-0.16.0" )
       )

))

(setq 
 ascope-database-regexps 
'(

   ( "^/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/europa"
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/europa" )
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/extension" )
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/platform" )
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/util" )
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone" )
     )

   ( "^/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone"
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/extension" )
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/europa" )
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/platform" )
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/util" )
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone" )
     )

   ( "^/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/europa/MWC-B210"
     ( "/Users/richard/share/xyan-znet-sdk/gecko-sdk-clone/europa/MWC-B210" )
     ( "/Users/richard/SimplicityStudio/SDKs/gecko_sdk_3/extension/matter_extension" )
     )

   ( "^/Users/richard/SimplicityStudio/SDKs/gecko_sdk_3"
     ( "/Users/richard/SimplicityStudio/SDKs/gecko_sdk_3/extension" )
     ( "/Users/richard/SimplicityStudio/SDKs/gecko_sdk_3/europa_matter" )
     ( "/Users/richard/SimplicityStudio/SDKs/gecko_sdk_3/platform" )
     ( "/Users/richard/SimplicityStudio/SDKs/gecko_sdk_3/util" )
     ( "/Users/richard/SimplicityStudio/SDKs/gecko_sdk_3" )
     )

))

(provide 'init-ascope)
