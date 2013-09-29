;; ==============================
;; Find configuration files
;; ==============================

(defvar emacs-config-dir
  (expand-file-name (concat user-emacs-directory "/config")))

(defun load-config (config)
    (load (expand-file-name config emacs-config-dir)))

;; ==============================
;; Customize
;; ==============================

(setq custom-file
      (expand-file-name "customize.el" emacs-config-dir))
(load custom-file 'noerror)

;; ==============================
;; Private settings
;; ==============================

(load (expand-file-name "private.el" emacs-config-dir) 'noerror)
