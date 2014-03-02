;; ==============================
;; Php-mode
;; ==============================

(require-package 'php-mode)

;; PHP mode - single line comments, instead of C-style:
(add-hook 'php-mode-hook
          (lambda (&rest ignore)
            (setq comment-start "//")
            (setq comment-end "")))

;; Automatically activate PHP mode for .php files
(add-to-list 'auto-mode-alist '("/*.\.php[345]?$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
