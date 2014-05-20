;; ==============================
;; Programming
;; ==============================

;; Silly camelCase
(add-hook 'prog-mode-hook 'subword-mode)

;; ==============================
;; Indentation, whitespace and indenting
;; ==============================

;; Indentation and offset rules
(setq-default tab-width 4)
(setq standard-indent 4)
;; (setq c-basic-offset 4)
;; (setq c-set-offset 4)
;; (setq sgml-basic-offset 4)

;; Tab stops
(setq tab-stop-list (number-sequence 4 120 4))

;; Save horizontal space
(c-set-offset 'arglist-intro '+)
(c-set-offset 'arglist-close 0)

;; Disable tabs completely - write spaces to file
(setq-default indent-tabs-mode nil)

;; Always make sure files have a final new line at the end
(setq require-final-newline t)
;; Clean up extra whitespace when saving a file
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

;; Sane commenting style
(setq comment-style 'indent)

;; Color parenthesis
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
