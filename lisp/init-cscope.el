(require 'xxcscope)

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

   ( "^/data/ddbs"
     ( "/data/ddbs/frameworks" )
     ( "/data/ddbs/bionic" )
     ( "/data/ddbs/system" )
     ( "/data/ddbs/build" )
     ( "/data/ddbs/external" )
     )

   ( "^/data/bsdd"
     ( "/data/bsdd/frameworks" )
     ( "/data/bsdd/system" )
     ( "/data/bsdd/bionic" )
     ( "/data/bsdd/build" )
     ( "/data/bsdd/external" )
     )

   ( "^/data/rowboat"
     ( "/data/rowboat/frameworks" )
     ( "/data/rowboat/bionic" )
     ( "/data/rowboat/build" )
     ( "/data/rowboat/system" )
     ( "/data/rowboat/external" )
     )

   ( "^/media/psf/share/d-live-root"
     ( "/media/psf/share/d-live-root" )
     ;; ( "/home/richard/android-sdk/adt-bundle-linux-x86-20130522/sdk/samples/android-18" )
     ;; ( "/home/richard/android-sdk/adt-bundle-linux-x86-20130522/sdk/sources/android-21" )
     ;; ( "/home/richard/msrc/android-source/frameworks" )
     )


   ( "^/media/psf/share/adsamples/source/AnimTest01"
     ( "/media/psf/share/adsamples/source/AnimTest01/app/src/main" )
     ( "/home/richard/msrc/android-source/frameworks" )
     ( "/home/richard/android-sdk/adt-bundle-linux-x86-20130522/sdk/sources/android-21" )
     )

   ( "^/home/richard/android-sdk/adt-bundle-linux-x86-20130522/sdk/samples/android-21"
     ( "/home/richard/android-sdk/adt-bundle-linux-x86-20130522/sdk/samples/android-21" )
     ( "/home/richard/android-sdk/adt-bundle-linux-x86-20130522/sdk/sources/android-21" )
     )

   ( "^/media/psf/share/droid-live/my_samples/ApiDemos"
     ( "/media/psf/share/droid-live/my_samples/ApiDemos" )
     ( "/home/richard/msrc/android-source/frameworks" )
     )

   ( "^/home/richard/msrc/android-source"
     ( "/home/richard/msrc/android-source/frameworks" )
     ( "/home/richard/msrc/android-source/dalvik" )
     ( "/home/richard/msrc/android-source/development" )
     ( "/home/richard/msrc/android-source/system" )
     ;; ( "/home/richard/msrc/android-source/bionic" )
     ;; ( "/home/richard/msrc/android-source/build" )
     ;; ( "/home/richard/msrc/android-source/external" )
     )
))

(provide 'init-cscope)
