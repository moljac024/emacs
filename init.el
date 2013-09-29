;; ==============================
;; Bootstrap the configuration
;; ==============================

(load (expand-file-name "core" (expand-file-name "config" user-emacs-directory)))

;; ==============================
;; Load needed packages
;; ==============================

(load-config "packages")

;; ==============================
;; Main configuration files
;; ==============================

(load-config "ui")
(load-config "themes")
(load-config "general")
(load-config "keybinds")
(load-config "iron-keys")
(load-config "files")
(load-config "dired")
(load-config "modes")
(load-config "buffers")
(load-config "images")
(load-config "irc")
(load-config "tabs")
(load-config "sql")
(load-config "util")
(load-config "flycheck")
(load-config "navigation")
(load-config "programming")
(load-config "lisp")
(load-config "haskell")
(load-config "php")
(load-config "evil")

;; ==============================
;; Open frequent files and directories
;; ==============================

(find-file-if-exists "~/.emacs.d/org/Notes.org")
(find-file-if-exists "~/.emacs.d/org/Activities.org")
(find-file-if-exists "~/.emacs.d/")
(find-file-if-exists "~/")

;; ==============================
;; Vendor packages, not part of repository
;; ==============================

(add-subfolders-to-load-path "~/.emacs.d/vendor")
(load-config "vendor")
