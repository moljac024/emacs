;;===============================
;; Emacs 24
;;===============================

;; ==============================
;; Requires
;; ==============================

;; Enable Common Lisp features
(require 'cl)

;; ==============================
;; Customize
;; ==============================

;; Keep customization in a separate file
(setq custom-file "~/.emacs.d/config/custom.el")
;; Load the customizations
(load custom-file 'noerror)

;; ==============================
;; Load configuration files
;; ==============================

(load "~/.emacs.d/config/general.el")
(load "~/.emacs.d/config/modes.el")
(load "~/.emacs.d/config/buffers.el")
(load "~/.emacs.d/config/dired.el")
(load "~/.emacs.d/config/images.el")
(load "~/.emacs.d/config/irc.el")
(load "~/.emacs.d/config/functions.el")
(load "~/.emacs.d/config/tabs.el")
(load "~/.emacs.d/config/sql.el")
(load "~/.emacs.d/config/keybinds.el")
(load "~/.emacs.d/config/private.el" 'noerror)
(load "~/.emacs.d/config/themes.el")
(load "~/.emacs.d/config/packages.el")
;; (load "~/.emacs.d/config/addons.el")

;; ==============================
;; Open frequent files and directories
;; ==============================

;; Open file only if it exists
(defun find-file-if-exists (file)
  (if (file-exists-p file)
      (find-file file)))

(find-file-if-exists "~/.emacs.d/org/Notes.org")
(find-file-if-exists "~/.emacs.d/org/Activities.org")
(find-file-if-exists "~/.emacs.d/")
(find-file-if-exists "~/.emacs.d/config/")
(find-file-if-exists "~/.emacs.d/elisp/")
(find-file-if-exists "/mnt/data")
;; (find-file-if-exists "/media/Moljac Transcend")
(find-file-if-exists "~/")

;; ==============================
;; Startup actions
;; ==============================

;; Start eshell
;; (eshell)

;; Start the emacs server
(server-start)
