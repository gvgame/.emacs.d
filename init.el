;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq custom-safe-themes t)
(add-to-list 'package-archives
         '("melpa-stable" ."http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives
         '("melpa" ."http://melpa.milkbox.net/packages/"))
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
;;(setq exec-path (append exec-path '("c:/Python36/")))
;;auto pair braces, quotes, etc.
(electric-pair-mode 1)

;;autocompletion
;;c/c++ autocompletion
(ac-config-default)
(load "~/.emacs.d/auto-complete-clang-async.el")
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)
(defun ac-common-setup()())
(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)
;;python autocompletion


(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

;;helm set up
(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;;overwatch theme
(load "~/.emacs.d/Overwatch-theme.el")
(set-cursor-color "#45ea22")
(load-theme 'Overwatch)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e42c65cdf4f64316be1c1b0d1f905b5f91c7b0072ff97124436bd3f2fbaf5973" "a2526ff60e4ee79acbfd468e2b07811cccd6d8329581b20ef776e24d291ec983" "ebaa636863d8d54972a448e102fd4c5f8de9f3dae73012a0c32ad16d09a9d1c3" "ddf9898f63b41dc6d93b62987f7672efecae2d5f9fdbf886709002354539c2dc" default)))
 '(package-selected-packages
   (quote
    (virtualenv jedi auto-yasnippet xpm floobits auto-complete rudel base16-theme aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
