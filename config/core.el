;; ==============================
;; Find configuration files
;; ==============================

(defun load-config (config)
  "Load configuration file"
  (let ((file-name (expand-file-name config (concat user-emacs-directory "/config"))))
      (load file-name)))

(defun find-file-if-exists (file)
  "Open file if it exists."
  (if (file-exists-p file)
      (find-file file)))

;; ==============================
;; Customize
;; ==============================

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
    (load custom-file))

;; ==============================
;; Load path
;; ==============================

(defun add-subdirs-to-list (parent-dir target-list)
  "Add all level PARENT-DIR subdirs to a list'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list target-list name)
        (add-subdirs-to-list name target-list)))))

;; Add directories to load path
(add-subdirs-to-list
 (expand-file-name "elisp" user-emacs-directory) 'load-path)
