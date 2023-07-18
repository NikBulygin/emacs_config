(require 'package)
(add-to-list 'package-archives
'("melpa" . "http://melpa.org/packages/") t)
 
(package-initialize)
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;; Uncomment the following line if you want to load the CMake builder.
(load "~/.emacs.d/modules/cmakebuilder/cmakebuilder.el")

(load "~/.emacs.d/modules/windows_settings/windows_settings.el")
(load "~/.emacs.d/modules/prettify/prettify.el")
(load "~/.emacs.d/modules/static_checker/cpp/checker.el")
(load "~/.emacs.d/modules/treemacs/treemacs.el")
(load "~/.emacs.d/modules/theme/doomtheme.el")
(load "~/.emacs.d/modules/irony/irony.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(pdf-tools zenburn-theme use-package treemacs-tab-bar treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil irony-eldoc flycheck-inline doom-themes company-irony cmake-mode cmake-ide clang-format auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


