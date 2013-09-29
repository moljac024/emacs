;; ==============================
;; Find configuration files
;; ==============================

(defvar emacs-config-dir
  (expand-file-name (concat user-emacs-directory "/config")))

(defun load-config (config)
    (load (expand-file-name config emacs-config-dir)))

;; TODO: Remove this duplicate code and combine these two functions
(defun add-subfolders-to-load-path (parent-dir)
 "Add all level PARENT-DIR subdirs to the `load-path'."
 (dolist (f (directory-files parent-dir))
   (let ((name (expand-file-name f parent-dir)))
     (when (and (file-directory-p name)
                (not (equal f ".."))
                (not (equal f ".")))
       (add-to-list 'load-path name)
       (add-subfolders-to-load-path name)))))

;; TODO: Add check if folder exists
(defun add-subfolders-to-theme-path (parent-dir)
 "Add all level PARENT-DIR subdirs to the `theme-path'."
 (dolist (f (directory-files parent-dir))
   (let ((name (expand-file-name f parent-dir)))
     (when (and (file-directory-p name)
                (not (equal f ".."))
                (not (equal f ".")))
       (add-to-list 'custom-theme-load-path name)
       (add-subfolders-to-theme-path name)))))

(defun find-file-if-exists (file)
  "Open file if it exists."
  (if (file-exists-p file)
      (find-file file)))

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
