;; ==============================
;; Evil mode
;; ==============================

;; How long to wait for chord
(setq key-chord-two-keys-delay 0.5)

;; Key chord
(key-chord-mode 1)

(add-hook 'evil-mode-hook
  (lambda ()
    ;; Evil keybinds - esc quits
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

;; Enable evil mode
(evil-mode 1)
