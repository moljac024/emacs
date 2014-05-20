;; ==============================
;; Helm - completion framework
;; ==============================

(require-package 'helm)
(global-set-key (kbd "C-c h") 'helm-mini)

;; ==============================
;; Ace jump mode - jump accross buffer
;; ==============================

(require-package 'ace-jump-mode)
(require-package 'ace-window)
(require-package 'ace-jump-buffer)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(defun ace-window-dwim (arg)
  "Activate ace-window if more than 2 windows are present on
screen, otherwise call other-window."
  (interactive "p")
  (if (> (length (window-list)) 2)
      (ace-window arg)
    (other-window arg)))

(define-key global-map
  [remap other-window] 'ace-window-dwim)

(add-hook 'evil-mode-hook
  (lambda ()
    ;; Key chords
    (key-chord-define evil-normal-state-map ",w" 'ace-window)
    (key-chord-define evil-normal-state-map ",b" 'ace-jump-buffer)
))
