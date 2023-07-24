;; Ensure 'use-package' is installed, if not, install it
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Setup 'cmake-mode' package
(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))  ;; Associate cmake files with cmake-mode

;; Setup 'cmake-ide' package
(use-package cmake-ide
  :ensure t
  :config
  (setq cmake-ide-flags-c++ (append '("-std=c++17")))  ;; Set C++ standard to C++17
  (setq cmake-ide-flags-c (append '("-std=c99")))  ;; Set C standard to C99
  (cmake-ide-setup))

;; Set the compile command for C++ files
(add-hook 'c++-mode-hook
          (lambda () (set (make-local-variable 'compile-command)
                           "cmake --build build && rc -J")))

;; Build CMake project function
(defun cmake--build ()
  "Build CMake project."
  (interactive)
  (let ((build-dir "build"))  ;; Adjust to your project structure
    (compile (format "cmake --build %s" build-dir))))

;; Build debug-mode CMake project function
(defun cmake--debug ()
  "Build debug-mode CMake project."
  (interactive)
  (let ((build-dir "build"))  ;; Adjust to your project structure
    (compile (format "cmake -DCMAKE_BUILD_TYPE=Debug %s && cmake --build %s" build-dir build-dir))))

;; Set keybindings for building and debugging
(global-set-key (kbd "C-x M-b") 'cmake--build)
(global-set-key (kbd "C-x M-d") 'cmake--debug)

;;; cmakebuilder.el ends here
