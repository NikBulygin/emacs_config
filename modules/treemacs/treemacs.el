(use-package treemacs
  :ensure t
  :defer t)

(use-package projectile
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)


(projectile-mode +1)
;(global-set-key (kbd "C-x t t") 'treemacs)
;(global-set-key (kbd "C-x t p") 'treemacs-projectile)
;(global-set-key (kbd "C-x t f") 'treemacs-find-file)
;(global-set-key (kbd "C-c o") 'projectile-find-other-file)
(add-hook 'emacs-startup-hook 'treemacs)



;(rtags-start-process-unless-running)
(global-set-key (kbd "C-c r s") 'rtags-find-symbol)
(global-set-key (kbd "C-c r u") 'rtags-location-stack-back)
