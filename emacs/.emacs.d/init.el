(server-start)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-eshell
                      starter-kit-bindings
                      ace-jump-mode
                      anzu
                      cider
                      clojure-mode
                      clojurescript-mode
                      exec-path-from-shell
                      gist
                      htmlize
                      magit
                      markdown-mode
                      puppet-mode
                      solarized-theme
                      yaml-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load-theme 'solarized-dark t)

(exec-path-from-shell-initialize)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files '("~/org"))
(setq org-default-notes-file "~/org/refile.org")
(setq org-refile-targets (quote ((nil :maxlevel . 3)
                                 (org-agenda-files :maxlevel . 3))))
(setq org-use-fast-todo-selection t)
(setq org-agenda-span 'day)
(setq org-todo-keywords
      '((sequence "TODO(t!)" "STARTED(s!)" "BLOCKED(b@)" "|"
                  "DONE(d!)" "CANCELLED(c@)")))
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
(setq org-log-into-drawer "LOGBOOK")

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
