;;===============================
;; Package management
;;===============================

;; Initialize package management
(package-initialize)
;; Add additional package archives
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Add a directory in home to load path
(add-to-list 'load-path "~/.emacs.d/elisp/")
