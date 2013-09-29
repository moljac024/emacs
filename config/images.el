;;===============================
;; Image viewing
;;===============================

(require 'image-mode)
(require 'cl)

(define-key image-mode-map "n" 'next-image-kill-current)
(define-key image-mode-map "p" 'previous-image-kill-current)
(define-key image-mode-map "w" 'set-as-wallpaper)
(define-key image-mode-map "e" 'edit-in-gimp)

(defun next-image (arg)
  "..."
  (interactive "P")
  (unless (and (buffer-file-name) (eq major-mode 'image-mode))
    (error "Not visiting a file in image mode"))
  (let* ((regexp  (image-file-name-regexp))
         (files   (directory-files default-directory nil regexp))
         (len     (length files))
         (this    (file-name-nondirectory (buffer-file-name)))
         (idx     0))
    (catch 'next-image
      (dolist (file  files)
        (when (string= this file) (throw 'next-image (1+ idx)))
        (setq idx  (1+ idx))))
    (setq idx  (+ idx (if arg -1 1)))
    (when (< idx 0) (setq idx (1- len)))
    (when (>= idx len) (setq idx 0))
    (find-file (elt files idx))))

(defun previous-image (arg)
  "..."
  (interactive "P")
  (next-image t))

(defun next-image-kill-current (arg)
  "..."
  (interactive "P")
  (let ((dead-buffer-walking (current-buffer)))
    (next-image arg)
    (kill-buffer dead-buffer-walking)))

(defun previous-image-kill-current (arg)
  "..."
  (interactive "P")
  (let ((dead-buffer-walking (current-buffer)))
    (next-image t)
    (kill-buffer dead-buffer-walking)))

(defun set-as-wallpaper ()
  "Sets currently viewed image as wallpaper"
  (interactive)
  (let* ((file (concat "\"" (buffer-file-name) "\""))
        (cmd (concat "bashwall -sa " file)))
    (shell-command cmd)))

(defun edit-in-gimp ()
  "Edits currently viewed image in GIMP"
  (interactive)
  (let* ((file (concat "\"" (buffer-file-name) "\""))
        (cmd (concat "gimp  " file)))
    (shell-command cmd)))
