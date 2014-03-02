;; ==============================
;; Org-mode
;; ==============================

;; Install newest org-mode package
(require-package 'org)

;; Files for org-mode (Notes and Activities)
(setq org-agenda-files (list (expand-file-name "org/" user-emacs-directory)))

;; Log TODO changes with timestamp
(setq org-log-done t)

;; Global keybinds for org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(defun open-notes-org ()
  "Open the notes file in org-mode"
  (interactive)
  (find-file (expand-file-name "org/Notes.org" user-emacs-directory)))
