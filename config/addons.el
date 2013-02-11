;;===============================
;; Extra emacs packages
;;===============================

;; ==============================
;; Keychord
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/key-chord")
(require 'key-chord)
(key-chord-mode 1)
;; How long to wait for chord
(setq key-chord-two-keys-delay 0.5)

;; ==============================
;; Evil
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/evil")
(require 'evil)
(evil-mode 1)

;; Evil settings
(setq evil-shift-width 4)

;; Evil keybinds - esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;; Evil keybinds - jj is escape
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

;; Delete words in hungarian notation, or underscores
(evil-define-motion evil-little-word (count)
  :type exclusive
  (let* ((case-fold-search nil)
         (count (if count count 1)))
    (while (> count 0)
      (forward-char)
      (search-forward-regexp "[_A-Z]\\|\\W" nil t)
      (backward-char)
      (decf count))))

;; Use dlw to delete little word
(define-key evil-operator-state-map (kbd "lw") 'evil-little-word)

;; Evil addon - surround
(add-to-list 'load-path "~/.emacs.d/elisp/evil-surround")
(require 'surround)
(global-surround-mode 1)

;; ==============================
;; Org-mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/org-mode/org-7.9.2/lisp/")
(require 'org-install)
;; Info directory
(add-to-list 'Info-default-directory-list
             (expand-file-name "~/.emacs.d/elisp/org-mode/org-7.9.2/info"))
;; Log TODO changes with timestamp
(setq org-log-done t)
;; Global keybinds for org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; ==============================
;; Smart-tab
;; ==============================

;; (add-to-list 'load-path "~/.emacs.d/elisp/smart-tab")
;; (require 'smart-tab)
;; (setq smart-tab-using-hippie-expand t)
;; (setq smart-tab-completion-functions-alist nil) ;; Don't be too smart with me boy
;; ;; Disable smart-tab in these modes:
;; (add-to-list 'smart-tab-disabled-major-modes 'eshell-mode)
;; (add-to-list 'smart-tab-disabled-major-modes 'rcirc-mode)
;; (global-smart-tab-mode 1)

;; ==============================
;; Lorem ipsum - dummy text generator
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/lorem-ipsum/")
(require 'lorem-ipsum)

;; ==============================
;; Undo tree
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/undo-tree/undo-tree-0.6.3")
(require 'undo-tree)
(global-undo-tree-mode 1)

;; ==============================
;; Magit - git integration with emacs
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/magit/magit-1.2.0")
(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)

;; ==============================
;; Rainbow delimeters
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/rainbow-delimiters")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; ==============================
;; Rainbow mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/rainbow-mode")
(require 'rainbow-mode)
;; Auto-enable rainbow in css mode
(add-hook 'css-mode-hook 'rainbow-mode)

;; ==============================
;; Emacs helm - steer me admiral
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/helm")
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x b") 'helm-buffers-list) ;; why doesn't helm-mode handle this?
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key iron-keys-mode-map (kbd "M-h") 'helm-mini)

;; ==============================
;; Ace Jump mode - easier navigation
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/ace-jump-mode")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key iron-keys-mode-map (kbd "M-s") 'ace-jump-mode)
(define-key iron-keys-mode-map (kbd "M-j") 'ace-jump-mode)

;; ==============================
;; Auto-complete
;; ==============================

;; (add-to-list 'load-path "~/.emacs.d/elisp/auto-complete/auto-complete-1.3.1/dict")
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/auto-complete-1.3.1/dict")
;; (require 'auto-complete-config)
;; (ac-config-default)

;; ==============================
;; YASnippets
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet/")
(require 'yasnippet)
(setq yas/verbosity 2)
(yas/global-mode 1)
;; Set the default promt for yasnippet
(setq yas/prompt-functions '(yas/ido-prompt
                             yas/dropdown-prompt
                             yas/completing-prompt))

;; Disable YAsnippets for term-mode
(add-hook 'term-mode-hook (lambda ()
                            (yas-minor-mode -1)))
;; Disable YAsnippets for eshell
(add-hook 'eshell-mode-hook (lambda ()
                            (yas-minor-mode -1)))

;; ==============================
;; SLIME - Superior Lisp Interaction Mode for Emacs
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/slime/slime-2013-02-09")
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(slime-setup '(slime-fancy))

;; ==============================
;; Javascript
;; ==============================

;; Js2 - improved javascript mode
;; (add-to-list 'load-path "~/.emacs.d/elisp/js2-mode")
;; (require 'js2-mode)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

;; ==============================
;; LUA mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/lua-mode")
(require 'lua-mode)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

;; ==============================
;; Python
;; ==============================

;; (add-to-list 'load-path "~/.emacs.d/elisp/python-mode/python-mode.el-6.0.12")
;; (setq py-install-directory "~/.emacs.d/elisp/python-mode/python-mode.el-6.0.12")
;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; ==============================
;; Haskell mode
;; ==============================

(load "~/.emacs.d/elisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; Haskell indentaion, choose one:
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; ==============================
;; Ruby
;; ==============================

;; Use default ruby version from rvm
;; (add-to-list 'load-path "~/.emacs.d/elisp/rvm/")
;; (require 'rvm)
;; (rvm-use-default)

;; ==============================
;; Rhtml
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/rhtml/")
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rjs$" . rhtml-mode))

;; ==============================
;; Jinja2
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/jinja2-mode/")
(require 'jinja2-mode)

;; ==============================
;; Web-mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/web-mode/")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))

;; ==============================
;; Multi-web-mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/multi-web-mode/")
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script[^>]*>" "</script>")
                  (css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;; (multi-web-global-mode 1)

;; ==============================
;; YAML mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/yaml-mode/")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; ==============================
;; HAML mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/haml-mode/")
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; ==============================
;; SASS mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/sass-mode/")
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

;; ==============================
;; Markdown mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/markdown-mode")
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
;; Behave nice with minor modes, don't hog the TAB key bro
(defun markdown-unset-tab ()
  "markdown-mode-hook"
  (define-key markdown-mode-map (kbd "<tab>") nil))
(add-hook 'markdown-mode-hook '(lambda() (markdown-unset-tab)))

;; ==============================
;; PHP mode
;; ==============================

(add-to-list 'load-path "~/.emacs.d/elisp/php-mode")
(require 'php-mode)
;; Force PEAR coding standards for PHP
(setq php-mode-force-pear t)
;; PHP mode - single line comments, instead of C-style:
(add-hook 'php-mode-hook
          (lambda (&rest ignore)
            (setq comment-start "//")
            (setq comment-end "")
            ))
(defun pear/php-mode-init()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close '0)
  )
(add-hook 'php-mode-hook 'pear/php-mode-init)
;; Automatically activate PHP mode for .php files
;; (No need with multi-major mode solutions like nxhtml, multi-web-mode etc.)
(add-to-list 'auto-mode-alist '("/*.\.php[345]?$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Flymake mode for php
;; (add-hook 'php-mode-hook (lambda() (flymake-mode 1)))
;; (define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
;; (define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)
