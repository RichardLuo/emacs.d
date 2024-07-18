(use-package xcscope
  :ensure t)

(require 'xcscope)

;; 自动启用 cscope 模式
(add-hook 'c-mode-common-hook 'cscope-minor-mode)

;; 配置使用 gtags-cscope 代替 cscope
(setq cscope-program "gtags-cscope")

;; told emacs do not update database evey time.
(setq cscope-do-not-update-database t)
(setq cscope-use-relative-paths t)

(define-key global-map [(s b)] 'cscope-display-buffer) ;s show
(define-key global-map [(s s)] 'cscope-find-this-symbol) ;C-c s s
(define-key global-map [(s p)] 'cscope-pop-mark)       ;p pop
(define-key global-map [(s d)] 'cscope-find-global-definition)
(define-key global-map [(s e)] 'cscope-find-egrep-pattern)
(define-key global-map [(s j)] 'cscope-find-global-definition-no-prompting)
(define-key global-map [(s i)] 'cscope-index-files)
(define-key global-map [(s I)] 'cscope-set-initial-directory)
(define-key global-map [(s P)] 'cscope-prev-symbol)
(define-key global-map [(s N)] 'cscope-next-symbol)
(define-key global-map [(s f)] 'cscope-find-this-file)
(define-key global-map [(s c)] 'cscope-find-functions-calling-this-function)

(setq 
 cscope-database-regexps 
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
 cscope-database-regexps 
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


(defface my-cscope-separator-face
  '((t :foreground "cyan"))
  "Face for cscope separator.")
(setq cscope-separator-face 'my-cscope-separator-face)
(defun my-cscope-display-buffer (buffer)
  "Display BUFFER, making sure it is cleared first."
  (with-current-buffer buffer
    (let ((inhibit-read-only t))
      (erase-buffer)))
  (display-buffer buffer))
(advice-add 'cscope-display-buffer :override #'my-cscope-display-buffer)

(provide 'init-xcscope)
