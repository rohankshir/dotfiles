;; set PATH
(setenv "PATH" (concat "/Library/TeX/texbin:" (getenv "PATH")))
(setq exec-path (append '("/Library/TeX/texbin:") exec-path))

(add-to-list 'load-path "~/.emacs.d")
(setq c-basic-offset 4) ; indents 4 chars                                                                                                              
(setq tab-width 4)          ; and 4 char wide for TAB
(setq indent-tabs-mode nil) ; And force use of spaces

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(setq inhibit-splash-screen t)         ; hide welcome screen
(setq inhibit-startup-message t)  ; hide start up message
(global-linum-mode t)             ; show line numbers
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0eebf69ceadbbcdd747713f2f3f839fe0d4a45bd0d4d9f46145e40878fc9b098" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; Ansi terminal
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq ansi-term-color-vector [unspecified "#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"])


;;; AUCTeX
;; Customary Customization, p. 1 and 16 in the manual, and http://www.emacswiki.org/emacs/AUCTeX#toc2
(setq TeX-parse-self t); Enable parse on load.
(setq TeX-auto-save t); Enable parse on save.
(setq-default TeX-master nil)

(setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)


;; Org Mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/work.org"
                             "~/org/school.org" 
                             "~/org/home.org"
                             "~/org/research.org"))

(setq org-startup-indented t)
(setq org-hide-leading-stars t)
(setq org-odd-level-only nil) 
(setq org-insert-heading-respect-content nil)
(setq org-M-RET-may-split-line '((item) (default . t)))
(setq org-special-ctrl-a/e t)
(setq org-return-follows-link nil)
(setq org-use-speed-commands t)
(setq org-startup-align-all-tables nil)
(setq org-log-into-drawer nil)
(setq org-tags-column 1)
(setq org-ellipsis " \u25bc" )
(setq org-speed-commands-user nil)
(setq org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
(setq org-completion-use-ido t)
(setq org-indent-mode t)
(setq org-startup-truncated nil)
(setq org-default-notes-file (concat org-directory "/notes.org"))
     (define-key global-map "\C-cc" 'org-capture)


(setq auto-fill-mode -1)
(setq-default fill-column 99999)
(setq fill-column 99999)
(global-auto-revert-mode t)
(prefer-coding-system 'utf-8)


(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)
