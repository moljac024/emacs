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
(define-key iron-keys-mode-map (kbd "M-s") 'ace-jump-mode)
(define-key iron-keys-mode-map (kbd "M-j") 'ace-jump-mode)
