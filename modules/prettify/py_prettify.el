(require 'py-autopep8)

(defun my/python-mode-hook ()
  ;; (python-docstring-mode)               ;
  (setq python-autopep8-options '("--max-line-length=79"))
  (add-hook 'before-save-hook 'py-autopep8-buffer t t))
(add-hook 'python-mode-hook 'my/python-mode-hook)
