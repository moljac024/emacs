;; ==============================
;; IDO - Interactively do things
;; ==============================

(ido-mode t)
(ido-everywhere t)

;; When no buffers match input, create new buffer
(setq ido-create-new-buffer 'always)

;; Disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; Better flex matching
(require-package 'flx-ido)
(use-package flx-ido
  :init
  (flx-ido-mode t))

;; Truly enable ido everywhere
(require-package 'ido-ubiquitous)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode t)

;; Display results vertically
(require-package 'ido-vertical-mode)
(use-package ido-vertical-mode
  :init
  (ido-vertical-mode t))
