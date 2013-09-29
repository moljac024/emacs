;; ==============================
;; Navigation
;; ==============================

;; Helm - easier navigation accross buffers and files
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key iron-keys-mode-map (kbd "M-h") 'helm-mini)

;; Ace jump mode - eaiser navigation in buffers
(define-key iron-keys-mode-map (kbd "M-s") 'ace-jump-mode)
(define-key iron-keys-mode-map (kbd "M-j") 'ace-jump-mode)
