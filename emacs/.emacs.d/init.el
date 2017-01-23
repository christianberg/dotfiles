(tool-bar-mode -1)
(scroll-bar-mode -1)

(server-start)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://stable.melpa.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(ace-jump-mode
                      anzu
                      cider
                      clojure-mode
                      clojurescript-mode
                      exec-path-from-shell
                      gist
                      htmlize
                      ido-ubiquitous
                      lua-mode
                      ledger-mode
                      magit
                      markdown-mode
                      paredit
                      puppet-mode
                      smex
                      solarized-theme
                      yaml-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(dolist (mode '(scheme emacs-lisp lisp clojure clojurescript))
  (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
            'paredit-mode))

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(load-theme 'solarized-dark t)

(exec-path-from-shell-initialize)

(add-hook 'before-save-hook 'whitespace-cleanup)

(global-set-key (kbd "C-c g") 'magit-status)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files '("~/org"))
(setq org-default-notes-file "~/org/tasks.org")
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets (quote ((nil :maxlevel . 3)
                                 (org-agenda-files :maxlevel . 3))))
(setq org-use-fast-todo-selection t)
(setq org-agenda-span 'day)
(setq org-todo-keywords
      '((sequence "NEXT(n!)" "|"
                  "DONE(d!)" "CANCELLED(c!)")))
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
(setq org-log-into-drawer "LOGBOOK")

(setq org-capture-templates
      '(("t" "Task" entry (file+datetree "~/org/tasks.org")
         "* NEXT %?\n%i\nEntered %T\n")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %T\n")))

(setq org-tag-alist '(("focus" . ?f)))
(setq org-agenda-custom-commands
      '(("w" "Work, focussed"
         ((agenda "")
          (tags "+focus-CATEGORY=\"privat\"")
          (tags-todo "TODO=\"STARTED\"-CATEGORY=\"privat\"")))
        ("h" "Home, focussed"
         ((agenda "")
          (tags "+focus-CATEGORY=\"zalando\"")
          (tags-todo "TODO=\"STARTED\"-CATEGORY=\"zalando\"")))
        ("r" "Refile"
         ((tags "CATEGORY=\"refile\"")))))

(add-hook 'org-mode-hook
          (lambda () (set-input-method 'latin-postfix)))

(add-hook 'org-load-hook
          (lambda () (run-at-time t 60 'org-save-all-org-buffers)))

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))

(setq org-crypt-key "FA132161")

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.pp$". puppet-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))

(setq standard-indent 2
      js-indent-level 2
      sh-indentation 2
      sh-basic-offset 2)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds (quote ("http://xkcd.com/atom.xml")))
 '(forecast-api-key "4b6893b6ab9157875fe5937714c610d6")
 '(forecast-city "Berlin")
 '(forecast-country "Germany")
 '(forecast-latitude 52.496)
 '(forecast-longitude 13.485)
 '(indent-tabs-mode nil)
 '(ledger-reports
   (quote
    (("budget" "ledger -f /Users/chberg/ledger/main.dat bal Budget -X € -e 'next month'")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)"))))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (org cargo rust-mode flycheck flycheck-clojure elfeed yaml-mode xkcd terraform-mode solarized-theme smex slamhound rainbow-delimiters puppet-mode paredit markdown-toc magit lua-mode ledger-mode ido-ubiquitous hyperbole htmlize gist forecast feature-mode exec-path-from-shell dockerfile-mode clojurescript-mode cider anzu ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
