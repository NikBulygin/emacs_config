(require 'company)
(require 'irony)
(require 'company-irony)

(add-hook 'after-init-hook 'global-company-mode) ;; Enable global Company mode

;; Add Irony backend to company
(setq company-backends (delete 'company-semantic company-backends))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; Enable Irony mode for C, C++, and Objective-C
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; Company/Irony should start completion when you start typing
(setq company-idle-delay 0)

;; Bind a hotkey for company-complete-irony
(global-set-key (kbd "C-M-x a") 'company-complete-common)



(defun update-rtags ()
  (let ((project-dir (locate-dominating-file default-directory "CMakeLists.txt")))
    (when project-dir
      (let* ((build-dir (concat project-dir "build/"))
             (compile-commands-file (concat build-dir "compile_commands.json")))
        (when (file-exists-p compile-commands-file)
          (start-process "rtags-reindex" nil
                         "rc" "-J" build-dir))))))

(add-hook 'after-save-hook 'update-rtags)
