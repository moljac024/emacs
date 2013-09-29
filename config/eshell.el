;;===============================
;; Eshell
;;===============================

;; Eshell files in emacs directory
(setq eshell-aliases-file "~/.emacs.d/eshell/alias")
(setq eshell-history-file-name "~/.emacs.d/eshell/history")
(setq eshell-last-dir-ring-file-name "~/.emacs.d/eshell/lastdir")
;; Eshell - prefer built-in lisp functions over external commands
(setq eshell-prefer-lisp-functions t)

(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))
