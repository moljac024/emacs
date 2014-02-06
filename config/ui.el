;; ==============================
;; Look and feel
;; ==============================

;; No startup message thank you
(setq inhibit-startup-message t)

;; Change the default font and font size
(set-face-attribute 'default nil :height 120)
;; (set-face-attribute 'default nil :family "Monospace")
;; (set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 120)
;; (set-face-attribute 'default nil :family "Andale Mono" :height 120)

;; UI elements
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
;; Show line and column number in the mode line
(line-number-mode 1)
(column-number-mode 1)
;; Display the time in mode line
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

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

;; Write y-or-n instead of yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;; Undo tree
(global-undo-tree-mode 1)

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Ido vertical mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
