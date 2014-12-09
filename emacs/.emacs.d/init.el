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

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.pp$". puppet-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))

(add-hook 'org-mode-hook
          (lambda () (set-input-method 'latin-postfix)))
