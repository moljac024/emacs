;; ==============================
;; Flycheck
;; ==============================

;; Turn flycheck on globally
(add-hook 'after-init-hook #'global-flycheck-mode)
;; No checkdock checker
(eval-after-load 'flycheck
  '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))
