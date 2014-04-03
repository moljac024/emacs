;; ==============================
;; Helm - completion framework
;; ==============================

(require-package 'helm)
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key iron-keys-mode-map (kbd "M-h") 'helm-mini)

;; ==============================
;; Ace jump mode - jump accross buffer
;; ==============================

(require-package 'ace-jump-mode)
(require-package 'ace-window)
(require-package 'ace-jump-buffer)

(define-key iron-keys-mode-map (kbd "M-s") 'ace-jump-mode)
(define-key iron-keys-mode-map (kbd "C-x C-o") 'ace-window)
(define-key iron-keys-mode-map (kbd "C-x C-b") 'ace-jump-buffer)

(add-hook 'evil-mode-hook
  (lambda ()
    ;; Key chords
    (key-chord-define evil-normal-state-map ",w" 'ace-window)
    (key-chord-define evil-normal-state-map ",b" 'ace-jump-buffer)
))
