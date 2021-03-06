;;===============================
;; Major modes associations
;;===============================

;; Default major-mode
;; (setq-default major-mode 'org-mode)

;; Shell mode - basically these files are shell scripts
(add-to-list 'auto-mode-alist '("\\.config/openbox/autostart$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash.mine$" . sh-mode))

;; Open html template files in html mode
(add-to-list 'auto-mode-alist '("\\.html.php$" . html-mode))

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

(require-package 'less-css-mode)

(require-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.mak$" . web-mode))
