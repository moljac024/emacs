;;===============================
;; SQL
;;===============================

(defun sql-connect-preset (name)
"Connect to a predefined SQL connection listed in `sql-connection-alist'"
(eval `(let ,(cdr (assoc name sql-connection-alist))
(flet ((sql-get-login (&rest what)))
(sql-product-interactive sql-product)))))

;; Sample configuration:
;; (setq sql-connection-alist
;;       '((mysql-local
;;          (sql-product 'mysql)
;;          (sql-server "127.0.0.1")
;;          (sql-user "me")
;;          (sql-password "mypassword")
;;          (sql-database "thedb")
;;          (sql-port 3306))
;;         (mysql-remote
;;          (sql-product 'mysql)
;;          (sql-server "1.2.3.4")
;;          (sql-user "me")
;;          (sql-password "mypassword")
;;          (sql-database "thedb")
;;          (sql-port 3307))
;;         ))

;; (defun sql-mysql-local-a ()
;; (interactive)
;; (sql-connect-preset 'mysql-local-a))
