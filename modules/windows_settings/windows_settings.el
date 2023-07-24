(setq inhibit-startup-screen t)

(defun custom-layout ()
  "Custom layout with the editor on top and console at the bottom."
  (interactive)
;  (delete-other-windows)
  (split-window-below -5)
  (other-window 1)
  (if (get-buffer "*eshell*")
      (switch-to-buffer "*eshell*")
    (eshell)))

(global-set-key (kbd "C-x t") 'custom-layout)

 
;; Imenu
(require 'imenu)		
(setq imenu-auto-rescan      t) ;; автоматически обновлять список функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
(global-set-key (kbd "<f6>") 'imenu) ;; вызов Imenu на F6

;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

;; Disable GUI components
;(tooltip-mode      -1)
;(menu-bar-mode     -1) ;; отключаем графическое меню
;; (tool-bar-mode     -1) ;; отключаем tool-bar
;; (scroll-bar-mode   -1) ;; отключаем полосу прокрутки
;; (blink-cursor-mode -1) ;; курсор не мигает
;; (setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал


;; Linum plugin
(require 'linum) ;; вызвать Linum
(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк

;; Scrolling settings
(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
(setq scroll-conservatively 10000)

;; End of file newlines
(setq require-final-newline    t) ;; добавить новую пустую строку в конец файла при сохранении
(setq next-line-add-newlines nil) ;; не добавлять новую строку в конец при смещении 
;; курсора  стрелками

;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

;; Easy transition between buffers: M-arrow-keys
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))



(global-display-fill-column-indicator-mode 1)
(setq-default fill-column 80)


(defun highlight-active-buffer ()
  (walk-windows (lambda (w)
                  (unless (eq w (selected-window))
                    (with-current-buffer (window-buffer w)
                      (buffer-face-set '(:background "#333"))))))
  (buffer-face-set 'default))

(defun auto-fill-my-code ()
  (setq-local comment-auto-fill-only-comments t)
  (setq-local fill-column 80)
  (auto-fill-mode 1))

(add-hook 'prog-mode-hook 'auto-fill-my-code)


(add-hook 'buffer-list-update-hook 'highlight-active-buffer)
