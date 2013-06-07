;;===============================
;; General settings
;;===============================

;; ==============================
;; Enable extra built-in packages
;; ==============================

;; Interactively do things
(require 'ido)
(ido-mode t)
;; Ido fuzzy matching
(setq ido-enable-flex-matching t)
(setq ido-enable-tramp-completion t)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil)
(setq ido-show-dot-for-dired t)

;; Better unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; Recently opened files
(require 'recentf)
(recentf-mode t)
;; Maximum number of files remembered
(setq recentf-max-saved-items 500)

;; Flymake - on the fly syntax error checking
(require 'flymake)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; ==============================
;; Look and feel
;; ==============================

;; No startup message thank you
(setq inhibit-startup-message t)

;; Change the default font and font size
(set-face-attribute 'default nil :height 120)
;; (set-face-attribute 'default nil :font Monospace)
;; (set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 120)

;; Disable toolbar
(tool-bar-mode -1)
;; Disable scrollbar
(scroll-bar-mode -1)
;; Disable menubar
(menu-bar-mode -1)

;; Show line-number in the mode line
(line-number-mode 1)
;; Show column-number in the mode line
(column-number-mode 1)
;; Display the time in mode line
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;; Highlith matching parentheses
;; (show-paren-mode 1)

;; Highlight the line only in current buffer
(setq hl-line-sticky-flag nil)
;; Enable line highlighting in certain modes
(add-hook 'dired-mode-hook 'hl-line-mode)
(add-hook 'Buffer-menu-mode-hook 'hl-line-mode)
(add-hook 'ibuffer-mode-hook 'hl-line-mode)
(add-hook 'bs-mode-hook 'hl-line-mode)
(add-hook 'emms-playlist-mode-hook 'hl-line-mode)

;; ANSI color in the emacs shell (M-x shell)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ==============================
;; Indentation, whitespace and indenting
;; ==============================

;; Indentation and offset rules
(setq-default tab-width 4)
(setq standard-indent 4)
;; (setq c-basic-offset 4)
;; (setq c-set-offset 4)
;; (setq sgml-basic-offset 4)

;; Save horizontal space
(c-set-offset 'arglist-intro '+)
(c-set-offset 'arglist-close 0)

;; Disable tabs completely - write spaces to file
(setq-default indent-tabs-mode nil)

;; Always make sure files have a final new line at the end
(setq require-final-newline t)
;; Automatically clean up extra whitespace when saving a file
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

;; Sane commenting style
(setq comment-style 'indent)

;; ==============================
;; Behavior
;; ==============================

;; Backtrace when a problem occurs
;; (setq debug-on-error t)

;; Transient mark mode aka visual selection
(setq transient-mark-mode t)

;; Delete selection - behave more like CUA
(delete-selection-mode t)

;; Don't save duplicate entries to kill ring
(setq kill-do-not-save-duplicates t)

;; Automatically reload files that change on disc
(global-auto-revert-mode)
;; Don't notify when automatically reverting a buffer to match the file
(setq auto-revert-verbose nil)

;; Write y-or-n instead of yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;; Version control for files
(setq version-control 'never)
;; Backup by copying instead of clobbering symlinks
(setq backup-by-copying t)
;; Number of versions to keep
(setq kept-new-versions 2)
(setq kept-old-versions 0)
;; Silently delete old versions of backups without nagging
(setq delete-old-versions t)
;; Save all backup files in this directory.
(setq backup-directory-alist `(("." . "~/.emacs.d/backup/")))
;; No backup files
(setq backup-inhibited t)
;; No auto-save files
(setq auto-save-default nil)
;; No session restore files
(setq auto-save-list-file-prefix nil)

;; Set default browser for opening links
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "x-www-browser")

;; TRAMP - set default method (can be su, sudo, ssh...)
(setq tramp-default-method "sudo")

;; Praise the lord! No more ediff window!
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; ==============================
;; Misc.
;; ==============================

;; Files for org-mode (Notes and Activities)
(setq org-agenda-files (list "~/.emacs.d/org/"))

;; Eshell files in emacs directory
(setq eshell-aliases-file "~/.emacs.d/eshell/alias")
(setq eshell-history-file-name "~/.emacs.d/eshell/history")
(setq eshell-last-dir-ring-file-name "~/.emacs.d/eshell/lastdir")
;; Eshell - prefer built-in lisp functions over external commands
(setq eshell-prefer-lisp-functions t)
