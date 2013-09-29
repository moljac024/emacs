;;===============================
;; Package management
;;===============================

(require 'cl)

;; Initialize package management
(package-initialize)

;; Add additional package archives
(add-to-list 'package-archives
             '("ELPA" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Automatically install missing packages
(load-config "dependencies")

(defun needed-packages-installed-p ()
  (loop for p in needed-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (needed-packages-installed-p)
  ;; Check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (message "%s" "Emacs is now installing missing packages...")
  (dolist (p needed-packages)
    (when (not (package-installed-p p))
      (package-install p))))
  (message "%s" " done.")
