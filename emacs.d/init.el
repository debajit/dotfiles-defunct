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


;; STARTUP CUSTOMIZATIONS

;; No startup screen. Start with scratch buffer
(setq inhibit-startup-screen +1)

;; Word wrapping
(set-default 'truncate-lines t)
(auto-fill-mode -1)

;; Whitespace
(setq show-trailing-whitespace 't)      ; Show trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; Delete trailing whitespace on save
(setq-default indent-tabs-mode nil)                      ; Use spaces for indentation


;; VISUAL TWEAKS

;; Scrolling
;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Colors
;; (if (display-graphic-p)
;;     (load-theme 'birds-of-paradise-plus t)
;;   (load-theme 'wombat t))
(load-theme 'birds-of-paradise-plus t)

;; Side margin
(setq-default left-fringe-width 0)
(setq-default right-fringe-width 0)

;; Enable line number mode
(setq linum-format " %d  ")
(global-linum-mode t)

;; Hide some GUI widgets
(tool-bar-mode -1)

;; OSX-specific settings
(when (eq system-type 'darwin)
  ;; Set font face
  (set-default-font "Menlo 14")

  ;; Mac-specific configuration
  ;; Swap Command and Option keys
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))


;; CONFIGURE PACKAGES

;; Helm
;; http://tuhdo.github.io/helm-projectile.html
(require 'projectile)
(require 'helm-config)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; Fuzzy matching
(require 'ido)
(ido-mode 1)

;; Status Bar
(require 'powerline)
(powerline-default-theme)


;;----------------------------------------------------------------------
;; Custom functions
;;-----------------------------------------------------------------------


;;----------------------------------------------------------------------
;; KEYBOARD SHORTCUTS
;;----------------------------------------------------------------------

;; Autocompletion
(global-set-key (kbd "M-/") 'hippie-expand)  ; Standard autocomplete
(global-set-key (kbd "M-RET") 'helm-dabbrev) ; TODO

;; Buffer management
(global-set-key (kbd "M-p") 'helm-multi-files) ; Show buffers, recent files etc.
(global-set-key [f6] 'helm-multi-files)        ; Show buffers, recent files etc.
(global-set-key (kbd "C-<tab>") 'other-window) ; Switch to other buffer
(global-set-key (kbd "M--") 'kill-this-buffer) ; Kill buffer
(global-set-key (kbd "M-=") 'delete-other-windows) ; Maximize this window

;; Core Emacs
(global-set-key (kbd "M-x") 'helm-M-x)  ; Meta + X -- Use Helm

;; File management
(global-set-key (kbd "M-o") 'helm-find-files) ; Meta + O -- Open file
(global-set-key (kbd "M-t") 'helm-projectile-find-file) ; Meta + T -- Open file in Project
(global-set-key (kbd "M-l") 'helm-do-grep) ; Meta + L -- Search in project

;; Git
(global-set-key [f5] 'vc-diff)          ; Git diff
(global-set-key [f7] 'magit-blame-mode) ; Git blame
(global-set-key [f8] 'magit-status)     ; Git status

;; Navigate and Search
(global-set-key (kbd "M-r") 'helm-semantic-or-imenu) ; Go to Symbol
(global-set-key [f3] 'helm-occur)       ; Find all in current file
(global-set-key (kbd "M-s") 'helm-google-suggest) ; Google search

;; Spell Check
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(global-set-key (kbd "M-:") 'flyspell-check-previous-highlighted-word)

;; Zoom text
(global-set-key (kbd "C-=") 'text-scale-increase) ; Increase text scale
(global-set-key (kbd "C--") 'text-scale-decrease) ; Decrese text scale


;; PALLET (sic) CUSTOMIZATIONS

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1cd9defef2a98138c732728568b04043afd321eb802d25a254777de9b2463768" "0f6e58d1814b4138c5a88241f96547d35883cbb3df6cf9ec8ef44856ece04c13" "2b56bd7a702f4dd5f50db417ec2bcdd06a878a0e2834e9ab37ad3c5c93aaab74" "a99e7c91236b2aba4cd374080c73f390c55173c5a1b4ac662eeb3172b60a9814" "c4e6fe8f5728a5d5fd0e92538f68c3b4e8b218bcfb5e07d8afff8731cc5f3df0" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" default)))
 '(package-selected-packages
   (quote
    (ujelly-theme tronesque-theme subatomic256-theme hc-zenburn-theme birds-of-paradise-plus-theme zenburn-theme helm-projectile powerline haml-mode projectile-rails helm pallet))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
