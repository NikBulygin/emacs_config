(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(use-package cmake-ide
  :ensure t
  :config
  (setq cmake-ide-flags-c++ (append '("-std=c++17")))
  (setq cmake-ide-flags-c (append '("-std=c99")))
  (cmake-ide-setup))

(add-hook 'c++-mode-hook
          (lambda () (set (make-local-variable 'compile-command)
                           "cmake --build build && rc -J")))

;; (defun cmake--build-and-run ()
;;   "Build and run CMake project."
;;   (interactive)
;;   (let ((build-dir "build") ; adjust to your project structure
;;         (project-name "your_project")) ; replace with your project name
;;     (compile (format "cmake --build %s --target %s && ./%s/%s"
;;                      build-dir project-name build-dir project-name))))

(defun cmake--build ()
  "Build CMake project."
  (interactive)
  (let ((build-dir "build")) ; adjust to your project structure
    (compile (format "cmake --build %s" build-dir))))

(defun cmake--debug ()
  "Build debug-mode CMake project."
  (interactive)
  (let ((build-dir "build")) ; adjust to your project structure
    (compile (format "cmake -DCMAKE_BUILD_TYPE=Debug %s && cmake --build %s" build-dir build-dir))))


;(global-set-key (kbd "C-x M-r") 'cmake--build-and-run)
(global-set-key (kbd "C-x M-b") 'cmake--build)
(global-set-key (kbd "C-x M-d") 'cmake--debug)

;;; cmakebuilder.el ends here
