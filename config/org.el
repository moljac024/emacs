;; ==============================
;; Org-mode
;; ==============================

;; Files for org-mode (Notes and Activities)
(setq org-agenda-files (list "~/.emacs.d/org/"))

;; Log TODO changes with timestamp
(setq org-log-done t)

;; Global keybinds for org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
