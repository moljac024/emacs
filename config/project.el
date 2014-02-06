(require 'simp)

;; Emacs
(simp-project-define
 '(:type emacs
   :has (init.el)))

;; Git project
(simp-project-define
  '(:has (.git)
    :ignore (.git)))

;; I bind the handy stuff like so:
(global-set-key (kbd "C-c f") 'simp-project-find-file)
(global-set-key (kbd "C-c d") 'simp-project-root-dired)
;; (global-set-key (kbd "C-c s") 'simp-project-rgrep)
;; (global-set-key (kbd "C-c S") 'simp-project-rgrep-dwim)
;; (global-set-key (kbd "C-c b") 'simp-project-ibuffer-files-only)
;; (global-set-key (kbd "C-c B") 'simp-project-ibuffer)
;; (global-set-key (kbd "C-c C-f") 'simp-project-with-bookmark-find-file)
;; (global-set-key (kbd "C-c C-s") 'simp-project-with-bookmark-rgrep)
;; (global-set-key (kbd "C-c C-b") 'simp-project-with-bookmark-ibuffer)

(projectile-global-mode)
(setq projectile-remember-window-config t)
