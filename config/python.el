;; ==============================
;; Python
;; ==============================

(require-package 'anaconda-mode)

(add-hook 'after-init-hook (lambda()
                             (add-to-list 'company-backends 'company-anaconda)
                             ))
