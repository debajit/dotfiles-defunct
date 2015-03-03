;; Colors
(load-theme 'wombat t)

(require 'ido)
(ido-mode t)

;; Mac-specific configuration
;; Swap Command and Option keys
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
;; Set font-size
(set-default-font "Menlo 14")
 
;; Mode settings
(setq default-abbrev-mode t)			; Auto Correct!
(setq scroll-step 1)				; Scroll like normal!
(setq-default auto-fill-function 'do-auto-fill)	; Word Wrap like normal!
(setq line-number-mode t)			; Show line number
(setq column-number-mode t)			; Show column number


;; Date and Time settings
;; http://www.perseguers.ch/epfl/linux/config/emacs

;; Insert the date, the time, and the date and time at point.

(defvar insert-time-format "%T"
  "*Format for \\[insert-time] (c.f. 'format-time-string' for how to format).")

(defvar insert-date-format "%Y/%m/%d"
  "*Format for \\[insert-date] (c.f. 'format-time-string' for how to format).")

(defun insert-time ()
  "Insert the current time according to the variable \"insert-time-format\"."
  (interactive "*")
  (insert (format-time-string insert-time-format
			      (current-time))))

(defun insert-date ()
  "Insert the current date according to the variable \"insert-date-format\"."
  (interactive "*")
  (insert (format-time-string insert-date-format
			      (current-time))))

(defun insert-time-and-date ()
    "Insert the current date according to the variable
\"insert-date-format\", then a space, then the current time according
to the variable \"insert-time-format\"."
    (interactive "*")
    (progn
      (insert-date)
      (insert " ")
      (insert-time)))

;; (global-set-key [f2] 'insert-date)
;; (global-set-key [f3] 'insert-time)
;; (global-set-key [f4] 'insert-time-and-date)

;; Keybindings
(global-set-key [f5] 'bs-show)
(global-set-key [f6] 'switch-to-buffer)
(global-set-key [f7] 'bury-buffer)
(global-set-key [f8] 'unbury-buffer)
