;;===============================
;; Extra emacs packages configuration
;;===============================


;; ==============================
;; Evil mode
;; ==============================

;; Evil keybinds - esc quits
(add-hook 'evil-mode-hook
          (lambda ()
            (define-key evil-normal-state-map [escape] 'keyboard-quit)
            (define-key evil-visual-state-map [escape] 'keyboard-quit)
            (define-key evil-normal-state-map (kbd "SPC") 'evil-scroll-page-down)
            (define-key evil-visual-state-map (kbd "SPC") 'evil-scroll-page-down)
            (define-key evil-normal-state-map (kbd "<backspace>") 'evil-scroll-page-up)
            (define-key evil-visual-state-map (kbd "<backspace>") 'evil-scroll-page-up)
            (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
            (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
            (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
            (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
            (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
            ;; Evil keybinds - jj is escape
            (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
            ))

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

;; Turn flycheck on globally
(add-hook 'after-init-hook #'global-flycheck-mode)
;; No checkdock checker
(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))
;; When to flycheck
;; (setq flycheck-check-syntax-automatically '(mode-enabled save))

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

;; How long to wait for chord
(setq key-chord-two-keys-delay 0.5)

;; ==============================
;; Helm - steer me admiral
;; ==============================

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
;; Haskell mode
;; ==============================

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; ==============================
;; Php-mode
;; ==============================

;; PHP mode - single line comments, instead of C-style:
(add-hook 'php-mode-hook
          (lambda (&rest ignore)
            (setq comment-start "//")
            (setq comment-end "")))
;; Automatically activate PHP mode for .php files
(add-to-list 'auto-mode-alist '("/*.\.php[345]?$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
