;; ==============================
;; Evil mode
;; ==============================

(require-package 'evil)
(require-package 'evil-matchit)

;; Key chord
(require-package 'key-chord)
(key-chord-mode 1)
;; How long to wait for chord
(setq key-chord-two-keys-delay 0.5)

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

    ;; Key chords
    (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
    (key-chord-define evil-visual-state-map "gc" 'comment-dwim-line)
    (key-chord-define evil-normal-state-map "gc" 'comment-dwim-line)
))

;; Emacs in evil insert mode
(setq evil-insert-state-map (make-sparse-keymap))
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)

;; Use vim keys for walking ido matches
(defun ido-evil-keys ()
  (define-key ido-completion-map (kbd "C-j") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-k") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-evil-keys)

;; Emulate surround.vim
(require-package 'surround)
(require 'surround)
(global-surround-mode 1)

(require-package 'evil-god-state)
(evil-define-key 'normal global-map "," 'evil-execute-in-god-state)
