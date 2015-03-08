;; PACKAGES

; Setup Melpa
(when (>= emacs-major-version 24)
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; Setup Pallet
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; No startup screen. Start with scratch buffer
(setq inhibit-startup-screen +1)

;; Colors
(load-theme 'wombat t)

;; Whitespace
(setq show-trailing-whitespace 't)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Word wrapping
(set-default 'truncate-lines t)

;; Mac-specific configuration
;; Swap Command and Option keys
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Set font-size
;;(set-default-font "Menlo 14")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (projectile-rails helm pallet))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
