;;===============================
;; Buffers
;;===============================

;; Don't nag about creating nonexisting buffers
(setq confirm-nonexistent-file-or-buffer nil)

;; Don't nag about killing buffers? Not sure...
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(defun my-kill-this-buffer ()
  "Kill the currently focused buffer, with some special handling"
  (interactive)
  (let ((kill-buffer-modes-ignore '(shell-mode eshell-mode term-mode))
        (kill-buffer-names-ignore '("*scratch*")))
    (if (or (member major-mode kill-buffer-modes-ignore)
            (member (buffer-name) kill-buffer-names-ignore))
        (switch-to-previous-buffer)
      (kill-buffer (current-buffer)))))

;; TODO: Investigate package emacs-lock
(defun my-server-kill-this-buffer ()
  "Kill the currently focused buffer, edited in server mode"
  (interactive)
  (if server-buffer-clients  ;; TODO: fix when not in server mode
      (server-edit)
    (my-kill-this-buffer)))

(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (insert initial-scratch-message)
  (lisp-interaction-mode))

;; Switch to last visited buffer
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer))))

;; Ibuffer ido find file
(defun ibuffer-ido-find-file ()
  "Like `ido-find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory (let ((buf (ibuffer-current-buffer)))
                              (if (buffer-live-p buf)
                                  (with-current-buffer buf
                                    default-directory)
                                default-directory))))
     (ido-find-file-in-dir default-directory))))

;; Better unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
