;; ==============================
;; Find configuration files
;; ==============================

(defvar emacs-config-dir
  (expand-file-name (concat user-emacs-directory "/config")))

(defun load-config (config)
  (load (expand-file-name config emacs-config-dir)))

;; ==============================
;; Load configuration files
;; ==============================

(load-config "core")
(load-config "general")
(load-config "modes")
(load-config "buffers")
(load-config "dired")
(load-config "images")
(load-config "irc")
(load-config "files")
(load-config "util")
(load-config "tabs")
(load-config "sql")
(load-config "keybinds")
(load-config "packages")
(load-config "themes")
(load-config "customize")
(load-config "addons")

;; ==============================
;; Customize
;; ==============================

(setq custom-file
      (expand-file-name "customize.el" emacs-config-dir))
(load custom-file 'noerror)

;; ==============================
;; Private settings
;; ==============================

(load (expand-file-name "private.el" emacs-config-dir) 'noerror)

;; ==============================
;; Open frequent files and directories
;; ==============================

(find-file-if-exists "~/.emacs.d/org/Notes.org")
(find-file-if-exists "~/.emacs.d/org/Activities.org")
(find-file-if-exists "~/.emacs.d/")
(find-file-if-exists "~/")

;; ==============================
;; Vendor packages
;; ==============================

(add-subfolders-to-load-path "~/.emacs.d/vendor")
(load-config "vendor")
