(require-package 'smex)

(use-package smex
  :init
  (smex-initialize)
  :bind (("M-x" . smex)
         ("<f2>" . smex)))
