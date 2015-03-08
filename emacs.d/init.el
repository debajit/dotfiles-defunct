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


;; VISUAL TWEAKS

;; Scrolling
;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; No startup screen. Start with scratch buffer
(setq inhibit-startup-screen +1)

;; Colors
(load-theme 'wombat t)

;; OSX-specific settings
(when (eq system-type 'darwin)
  ;; Set font face
  (set-default-font "Menlo 14")

  ;; Mac-specific configuration
  ;; Swap Command and Option keys
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

;; Whitespace
(setq show-trailing-whitespace 't)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Word wrapping
(set-default 'truncate-lines t)


;; KEYBOARD SHORTCUTS

;; Core Emacs
(global-set-key (kbd "M-x") 'helm-M-x)	; Meta + X -- Use Helm

;; Text scale
(global-set-key (kbd "C-=") 'text-scale-increase) ; Increase text scale
(global-set-key (kbd "C--") 'text-scale-decrease) ; Decrese text scale

;; File management
(global-set-key (kbd "M-o") 'helm-find-files) ; Meta + O -- Open file
(global-set-key (kbd "M-t") 'helm-projectile-find-file) ; Meta + T -- Open file in Project
(global-set-key (kbd "M-l") 'helm-do-grep) ; Meta + L -- Search in project

;; Autocompletion
(global-set-key (kbd "M-/") 'hippie-expand)  ; Standard autocomplete
(global-set-key (kbd "M-RET") 'helm-dabbrev) ; TODO

;; Buffer management
(global-set-key (kbd "M-p") 'helm-buffers-list) ; Show buffers
(global-set-key (kbd "S-k") 'kill-this-buffer) ; Kill this buffer (Comes with Emacs)
(global-set-key (kbd "M-0") 'delete-other-windows) ; Maximize this window

;; Spell Check
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(global-set-key (kbd "M-:") 'flyspell-check-previous-highlighted-word)

;; Other services
(global-set-key (kbd "M-s") 'helm-google-suggest) ; Google search

;; PALLET (sic) CUSTOMIZATIONS

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (haml-mode projectile-rails helm pallet))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
