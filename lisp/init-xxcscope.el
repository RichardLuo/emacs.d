(require 'xxcscope)
;; (cscope-setup)

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


;; (define-key global-map [(control f3)]  'cscope-set-initial-directory)
;; (define-key global-map [(control f4)]  'cscope-unset-initial-directory)
;; (define-key global-map [(control f5)]  'cscope-find-this-symbol)
;; (define-key global-map [(control f6)]  'cscope-find-global-definition)
;; (define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
;; (define-key global-map [(control f8)]  'cscope-pop-mark)
;; (define-key global-map [(control f9)]  'cscope-next-symbol)
;; (define-key global-map [(control f10)] 'cscope-next-file)
;; (define-key global-map [(control f11)] 'cscope-prev-symbol)

;; (define-key global-map [(control f12)] 'cscope-prev-file)
;; (define-key global-map [(meta f9)]  'cscope-display-buffer)
;; (define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)

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
   ( "^/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/europa"
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/europa" )
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/extension" )
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/platform" )
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/util" )
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone" )
     )

   ( "^/media/psf/share/xyan-znet-sdk/gecko-sdk-clone"
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/extension" )
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/europa" )
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/platform" )
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/util" )
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone" )
     )

   ( "^/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/europa/MWC-B210"
     ( "/media/psf/share/xyan-znet-sdk/gecko-sdk-clone/europa/MWC-B210" )
     ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk_3/extension/matter_extension" )
     )

   ;; ( "^/media/psf/SimplicityStudio/SDKs/gecko_sdk_3"
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk_3/extension" )
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk_3/europa_matter" )
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk_3/platform" )
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk_3/util" )
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk_3" )
   ;;   )

   ;; ( "^/media/psf/SimplicityStudio/SDKs/gecko_sdk"
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk/matter_extension" )
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk/extension" )
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk/europa" )
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk/platform" )
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk/util" )
   ;;   ( "/media/psf/SimplicityStudio/SDKs/gecko_sdk" )
   ;;   )

))



;; (setq cscope-database-regexps
;;       '(
;;         ( "^/users/jdoe/sources/proj1"
;;           ( t )
;;           ( "/users/jdoe/sources/proj2")
;;           ( "/users/jdoe/sources/proj3/mycscope.out")
;;           ( "/users/jdoe/sources/proj4")
;;           t
;;           ( "/some/master/directory" ("-d" "-I/usr/local/include") )
;;           )
;;         ( "^/users/jdoe/sources/gnome/"
;;           ( "/master/gnome/database" ("-d") )
;;           )
;;         ))


(defun my-setup-cscope ()
  (require 'xxcscope))

(add-hook 'c-mode-common-hook 'my-setup-cscope)
(add-hook 'dts-mode-hook 'my-setup-cscope)


;; (add-hook 'c-mode-common-hook
;; 	  '(lambda ()
;; 	    (require 'xxcscope)))

(provide 'init-xxcscope)
