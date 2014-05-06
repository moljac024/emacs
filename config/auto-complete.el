;;===============================
;; Auto complete mode
;;===============================

(require-package 'company)

;; Activate globally
(add-hook 'after-init-hook 'global-company-mode)

;; No delay, show completion immediately
(setq company-idle-delay t)

(add-hook 'eshell-mode-hook
  (lambda ()
    ;; Disable company mode
    (company-mode -1)))
