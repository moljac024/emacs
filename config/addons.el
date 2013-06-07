;;===============================
;; Extra emacs packages
;;===============================


;; ==============================
;; Evil mode
;; ==============================

;; ;; Evil mode
;; (evil-mode 1)
;; ;; Evil surround
;; (global-surround-mode 1)

;; ;; Evil keybinds - esc quits
;; (define-key evil-normal-state-map [escape] 'keyboard-quit)
;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;; ;; Evil keybinds - jj is escape
;; (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

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
;; Flycheck - on the fly syntax checking
;; ==============================

;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; No checkdock checker
;; (eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

;; ==============================
;; Whole line or region
;; ==============================

(require 'whole-line-or-region)
(whole-line-or-region-mode)

;; ==============================
;; Auto-pair
;; ==============================

(require 'autopair)
(autopair-global-mode)

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

;; (require 'key-chord)
;; (key-chord-mode 1)
;; ;; How long to wait for chord
;; (setq key-chord-two-keys-delay 0.5)

;; ==============================
;; Auto-complete mode
;; ==============================

(require 'auto-complete)
(global-auto-complete-mode)

;; ==============================
;; Helm - steer me admiral
;; ==============================

;; (helm-mode 1)
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
(add-hook 'php-mode-hook 'pear/php-mode-init)
;; PHP mode - single line comments, instead of C-style:
(add-hook 'php-mode-hook
          (lambda (&rest ignore)
            (setq comment-start "//")
            (setq comment-end "")))
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
