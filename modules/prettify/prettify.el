(unless (package-installed-p 'clang-format)
  (package-install 'clang-format))


(require 'clang-format)

(defun clang-format-before-save ()
  (interactive)
  (when (eq major-mode 'c++-mode) 
    (clang-format-buffer)))

(add-hook 'before-save-hook 'clang-format-before-save)
