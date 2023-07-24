(require 'company)
(require 'company-auctex)

(add-hook 'after-init-hook 'global-company-mode) ;; Enable global Company mode

;; Add AUCTeX backend to company
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-auctex))

;; Company should start completion when you start typing
(setq company-idle-delay 0)

(add-hook 'LaTeX-mode-hook 'flycheck-mode)

(setq TeX-engine 'xetex)
(setq-default TeX-engine 'xetex)
