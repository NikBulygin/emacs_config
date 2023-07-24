;; Initial setup for package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Loading external modules
(load "~/.emacs.d/modules/cmakebuilder/cmakebuilder.el")        ;; CMake Builder
(load "~/.emacs.d/modules/fast_latex/fast_latex.el")
(load "~/.emacs.d/modules/windows_settings/windows_settings.el") ;; Window settings
(load "~/.emacs.d/modules/theme/doomtheme.el")                  ;; Doom theme

;; Setting up code formatting and checking
(load "~/.emacs.d/modules/prettify/cpp_prettify.el")            ;; Prettify for C++
(load "~/.emacs.d/modules/static_checker/cpp/checker.el")       ;; Static check for C++
(load "~/.emacs.d/modules/prettify/py_prettify.el")             ;; Prettify for Python
(load "~/.emacs.d/modules/static_checker/python/python.el")     ;; Static check for Python

;; Setting up additional features
(load "~/.emacs.d/modules/treemacs/treemacs.el")                ;; Treemacs
(load "~/.emacs.d/modules/irony/irony.el")                      ;; Irony
(load "~/.emacs.d/modules/python_autocomplete/py-autocomplete.el") ;; Python autocomplete
(load "~/.emacs.d/modules/py_debug/debug.el") ;; Python debugger

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(package-selected-packages
   '(unicode-math-input dap-mode realgud-ipdb py-autopep8 tree-sitter python-docstring lsp-mode lsp-python-ms company-auctex auctex pdf-tools zenburn-theme use-package treemacs-tab-bar treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil irony-eldoc flycheck-inline doom-themes company-irony cmake-mode cmake-ide clang-format auto-complete)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(preview-face ((t nil)))
 '(preview-reference-face ((t (:background "dark gray")))))
