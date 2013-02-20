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

;; ==============================
;; Org-mode
;; ==============================

;; Log TODO changes with timestamp
(setq org-log-done t)
;; Global keybinds for org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; ==============================
;; Undo-tree
;; ==============================

(require 'undo-tree)
(global-undo-tree-mode 1)

;; ==============================
;; Magit
;; ==============================

(global-set-key (kbd "C-c g") 'magit-status)

;; ==============================
;; Rainbow-delimiters
;; ==============================

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; ==============================
;; Rainbow-mode
;; ==============================

(add-hook 'css-mode-hook 'rainbow-mode)

;; ==============================
;; Keychord
;; ==============================

(require 'key-chord)
(key-chord-mode 1)
;; How long to wait for chord
(setq key-chord-two-keys-delay 0.5)

;; ==============================
;; Auto-complete mode
;; ==============================

(require 'auto-complete)
(global-auto-complete-mode)

;; ==============================
;; Helm - steer me admiral
;; ==============================

(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key iron-keys-mode-map (kbd "M-h") 'helm-mini)

;; ==============================
;; Ace jump mode
;; ==============================

(define-key iron-keys-mode-map (kbd "M-s") 'ace-jump-mode)
(define-key iron-keys-mode-map (kbd "M-j") 'ace-jump-mode)

;; ==============================
;; Slime
;; ==============================

(setq inferior-lisp-program "/usr/bin/sbcl")

;; ==============================
;; YASnippet
;; ==============================

(require 'yasnippet)
(yas-global-mode 1)

;; ==============================
;; Haskell mode
;; ==============================

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; ==============================
;; Php-mode
;; ==============================

;; Force PEAR coding standards for PHP
(setq php-mode-force-pear t)
;; PHP mode - single line comments, instead of C-style:
;; (add-hook 'php-mode-hook
;;           (lambda (&rest ignore)
;;             (setq comment-start "//")
;;             (setq comment-end "")
;;             ))
;; (defun pear/php-mode-init()
;;   "Set some buffer-local variables."
;;   (setq case-fold-search t)
;;   (c-set-offset 'arglist-intro '+)
;;   (c-set-offset 'arglist-close '0)
;;   )
(add-hook 'php-mode-hook 'pear/php-mode-init)
;; Automatically activate PHP mode for .php files
;; (No need with multi-major mode solutions like nxhtml, multi-web-mode etc.)
(add-to-list 'auto-mode-alist '("/*.\.php[345]?$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Flymake mode for php
;; (add-hook 'php-mode-hook (lambda() (flymake-mode 1)))
;; (define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
;; (define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)

;; ==============================
;; Twig-mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/twig-mode/")
(require 'twig-mode)
