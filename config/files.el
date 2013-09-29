;;===============================
;; Files
;;===============================

;; Recently opened files
(require 'recentf)
(recentf-mode t)
;; Maximum number of files remembered
(setq recentf-max-saved-items 500)

;; TRAMP - set default method (can be su, sudo, ssh...)
(setq tramp-default-method "sudo")

;; Version control for files
(setq version-control 'never)
;; Backup by copying instead of clobbering symlinks
(setq backup-by-copying t)
;; Number of versions to keep
(setq kept-new-versions 2)
(setq kept-old-versions 0)
;; Silently delete old versions of backups without nagging
(setq delete-old-versions t)
;; Save all backup files in this directory.
(setq backup-directory-alist `(("." . "~/.emacs.d/backup/")))
;; No backup files
(setq backup-inhibited t)
;; No auto-save files
(setq auto-save-default nil)
;; No session restore files
(setq auto-save-list-file-prefix nil)

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

(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name "/"))))
    (find-file tramp-file-name)))

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(defun ido-recentf-open-fancy ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (let ((home (expand-file-name (getenv "HOME"))))
    (find-file
     (ido-completing-read "Find recent file: "
                          (mapcar (lambda (path)
                                    (replace-regexp-in-string home "~" path))
                                  recentf-list)
                          nil t))))
