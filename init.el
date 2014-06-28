;; ==============================
;; Bootstrap the configuration
;; ==============================

(load (expand-file-name "core" (expand-file-name "config" user-emacs-directory)))

;; ==============================
;; Package configuration
;; ==============================

(load-config "packages")

;; ==============================
;; Main configuration files
;; ==============================

(load-config "ui")
(load-config "undo")
(load-config "themes")
(load-config "general")
(load-config "ido")
(load-config "keybinds")
(load-config "iron-keys")
(load-config "files")
(load-config "org")
(load-config "eshell")
(load-config "dired")
(load-config "modes")
(load-config "buffers")
(load-config "images")
(load-config "irc")
(load-config "sql")
(load-config "util")
(load-config "programming")

;; ==============================
;; Language specific configuration
;; ==============================

(load-config "css")
(load-config "lisp")
(load-config "haskell")
(load-config "php")
(load-config "javascript")

;; ==============================
;; Extra packages
;; ==============================

(load-config "modeline")
(load-config "smex")
(load-config "auto-complete")
(load-config "snippets")
(load-config "navigation")
(load-config "flycheck")
(load-config "project")
(load-config "magit")
;; (load-config "evil")
;; (load-config "golden-ratio")

;; ==============================
;; Open frequent files and directories
;; ==============================

(find-file-if-exists "~/.emacs.d/org/Notes.org")
(find-file-if-exists "~/.emacs.d/org/Activities.org")
(find-file-if-exists "~/.emacs.d/")
(find-file-if-exists "~/")

;; ==============================
;; Enable Evil mode
;; ==============================
;; (evil-mode t)
