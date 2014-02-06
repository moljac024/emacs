(projectile-global-mode)
(setq projectile-remember-window-config t)

;; Use projectile with evil
(add-hook 'evil-mode-hook
  (lambda ()
    ;; Switch buffers
    (define-key evil-normal-state-map (kbd "C-b") 'projectile-switch-to-buffer)
    ;; Projectile find fiel
    (define-key evil-normal-state-map (kbd "C-f") 'projectile-find-file)
    (define-key evil-normal-state-map (kbd "C-p") 'projectile-commander)
))
