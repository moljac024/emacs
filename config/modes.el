;;===============================
;; Major modes for files
;;===============================

;; Default major-mode
;; (setq-default major-mode 'org-mode)

;; Shell mode - basically these files are shell scripts
(add-to-list 'auto-mode-alist '("\\.config/openbox/autostart$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash.mine$" . sh-mode))

;; Config mode
(add-to-list 'auto-mode-alist '("\\.git" . conf-unix-mode))

;; Emacs comes with two built-in javascript modes:
;; javascript-mode - which is outdated, and
;; js-mode - which is what we will use
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("composer.lock" . js2-mode))

;; Open html template files in html mode
(add-to-list 'auto-mode-alist '("\\.html.php$" . html-mode))
;; Mako templating engine for python
(add-to-list 'auto-mode-alist '("\\.mak" . html-mode))

;; Less files, open them in css-mode, it's good enough
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

;; Ruby
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))

;;===============================
;; Minor modes
;;===============================

;; Silly camelCase
(add-hook 'prog-mode-hook 'subword-mode)
