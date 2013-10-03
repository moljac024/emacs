;;===============================
;; General settings
;;===============================

;; Backtrace when a problem occurs
;; (setq debug-on-error t)

;; Scroll by single lines
(setq-default scroll-step 1)

;; Delete selection - behave more like CUA
(delete-selection-mode t)

;; Don't save duplicate entries to kill ring
(setq kill-do-not-save-duplicates t)

;; Automatically reload files that change on disc
(global-auto-revert-mode)
;; Don't notify when automatically reverting a buffer to match the file
(setq auto-revert-verbose nil)

;; Set default browser for opening links
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "x-www-browser")

;; Praise the lord! No more ediff window!
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Horizontal split if window is wide enough
(setq ediff-split-window-function (if (> (frame-width) 120)
                                          'split-window-horizontally
                                        'split-window-vertically))

;; Interactively do things
(require 'ido)
(ido-mode t)
;; Ido fuzzy matching
(setq ido-enable-flex-matching t)
(setq ido-enable-tramp-completion t)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil)
(setq ido-show-dot-for-dired t)
