;; ==============================
;; Load extra packages
;; ==============================

;; Whole line or region
(require 'whole-line-or-region)
(whole-line-or-region-mode)

;; Auto-pair
(autopair-global-mode)

;; Undo tree
(global-undo-tree-mode 1)

;; Key chord
(key-chord-mode 1)

;; How long to wait for chord
(setq key-chord-two-keys-delay 0.5)

;; Auto-complete
(require 'auto-complete)
(global-auto-complete-mode)

;; YASnippet
;; (yas-global-mode 1)

;; Evil mode
(evil-mode 1)
