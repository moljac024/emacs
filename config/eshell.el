;;===============================
;; Eshell
;;===============================

;; Eshell files in emacs directory
(setq eshell-aliases-file (expand-file-name "eshell/alias" user-emacs-directory))
(setq eshell-history-file-name (expand-file-name "eshell/history" user-emacs-directory))
(setq eshell-last-dir-ring-file-name (expand-file-name "eshell/lastdir" user-emacs-directory))

;; Eshell - prefer built-in lisp functions over external commands
(setq eshell-prefer-lisp-functions t)

(defun eshell/clear ()
  "Clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))
