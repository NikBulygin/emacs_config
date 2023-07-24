;; Require necessary packages
(require 'company)
(require 'irony)
(require 'company-irony)

;; Enable Company mode globally
(add-hook 'after-init-hook 'global-company-mode)

;; Remove company-semantic from backends list
(setq company-backends (delete 'company-semantic company-backends))

;; Add company-irony to backends list
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; Enable Irony mode for C, C++, and Objective-C
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; Set Company/Irony to start completion as soon as you start typing
(setq company-idle-delay 0)

;; Bind a hotkey for company-complete-common
(global-set-key (kbd "C-M-x a") 'company-complete-common)

;; Function to update rtags
(defun update-rtags ()
  "Find CMakeLists.txt in parent directory and reindex project using rtags."
  (let ((project-dir (locate-dominating-file default-directory "CMakeLists.txt")))
    (when project-dir
      (let* ((build-dir (concat project-dir "build/"))
             (compile-commands-file (concat build-dir "compile_commands.json")))
        (when (file-exists-p compile-commands-file)
          (start-process "rtags-reindex" nil
                         "rc" "-J" build-dir))))))

;; Add after-save-hook to update rtags
(add-hook 'after-save-hook 'update-rtags)
