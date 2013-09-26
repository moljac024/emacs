;;===============================
;; Irc
;;===============================

;; rcirc - auto authenticate
(setq rcirc-auto-authenticate-flag t)
;; rcirc - default nickname
(setq rcirc-default-nick "moljac024")
;; rcirc - include date in time stamp.
(setq rcirc-time-format "%d-%m-%Y %H:%M ")
;; Wrap lines at the width of the current column (use maximum space available)
(setq rcirc-fill-column (quote frame-width))
;; rcirc - server and channel join list
;; (setq rcirc-server-alist '(("irc.freenode.net" :nick "moljac024" :channels
;;                                     ("#emacs" "#lugons"))))

;; (add-to-list 'rcirc-server-alist '("irc.quakenet.org" :nick "moljac024" :channels
;;                                     ("#nk-inc" )))

;; rcirc - authinfo
;; (setq rcirc-authinfo '(("freenode" nickserv "moljac024" "password")
;;                        ;; ("freenode" chanserv "moljac024" "#moljacland" "password")
;;                        ("bitlbee" bitlbee "moljac024" "password")))
