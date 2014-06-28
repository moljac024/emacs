;;===============================
;; Auto complete mode
;;===============================

(require-package 'company)

;; Activate globally
(add-hook 'after-init-hook 'global-company-mode)

;; No delay, show completion immediately
(setq company-idle-delay t)

;; Disable company mode in eshell
(add-hook 'eshell-mode-hook
  (lambda ()
    (company-mode -1)))
