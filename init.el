(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)

;; keep emacs custom settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'package)
(add-to-list 'package-archives
                          '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun packages-install () 
  (package-install 'evil)
  (package-install 'magit))

(condition-case nil 
                (packages-install) 
                (error 
                  (package-refresh-contents)
                  (packages-install)))

;; packages:
;; evil
(require 'evil)
(evil-mode 1)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
