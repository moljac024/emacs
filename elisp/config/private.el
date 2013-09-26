;;===============================
;; Private/sensitive elisp
;;===============================

;; rcirc - authinfo
(setq rcirc-authinfo '(("freenode" nickserv "moljac024" "smokiblaah7")
                       ;; ("freenode" chanserv "moljac024" "#moljacland" "smoki")
                       ("bitlbee" bitlbee "moljac024" "smoki")))

;; SQL connection presets
(setq sql-connection-alist
      '((mysql-local-root
         (sql-product 'mysql)
         (sql-server "127.0.0.1")
         (sql-user "root")
         (sql-password "dd7ubm2")
         (sql-database "mysql")
         (sql-port 3306))
        (mysql-local-a
         (sql-product 'mysql)
         (sql-server "127.0.0.1")
         (sql-user "bojan")
         (sql-password "blaah7")
         (sql-database "test")
         (sql-port 3306))
        ))

(defun sql-mysql-local-root ()
(interactive)
(sql-connect-preset 'mysql-local-root))
