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
(setq rcirc-server-alist '(("irc.freenode.net" :nick rcirc-default-nick
                            :channels ("#emacs" "#lugons"))))
