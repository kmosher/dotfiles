;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual Nicities
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'color-theme)

;(load-library "kmosher-color-theme")
(global-font-lock-mode 1)
(color-theme-initialize)
(color-theme-hober)

; Show column numbers
(column-number-mode 1)
(setq-default fill-column 80)
;;(setq auto-fill-mode 1)

; Show what's being selected
(transient-mark-mode 1)

; Show matching parentheses
(show-paren-mode 1)

; Line by line scrolling
(setq scroll-step 1)
(setq inhibit-startup-message t)

; Show tabs and trailing whitespace
(require 'whitespace)
(setq whitespace-style '(face tabs space-before-tab tab-mark empty))
(global-whitespace-mode t)
(setq-default show-trailing-whitespace t)

; This is like the trailing-line setting for whitespace-style
; Except it uses preprend, so it doesn't clobber other faces
(add-hook 'font-lock-mode-hook (function (lambda ()
 (font-lock-add-keywords nil
   `((,(format
	  "^\\([^\t\n]\\{%s\\}\\|[^\t\n]\\{0,%s\\}\t\\)\\{%d\\}%s\\(.+\\)$"
	  tab-width (- tab-width 1)
      (/ 80 tab-width)
	  (let ((rem (% 80 tab-width)))
	    (if (zerop rem)
		""
		(format ".\\{%d\\}" rem))))
	 (2 'whitespace-line prepend)))
   t))))


; Highlight column 80
(add-hook 'whitespace-mode-hook (lambda () (interactive) (column-marker-1 80)))
(require 'column-marker)


;Disable the menubar (promotes good emacs memory :)
;(menu-bar-mode -1)
;(tool-bar-mode -1)
;(scroll-bar-mode -1)

(require 'rainbow-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Increase/Decrease font size on the fly
;;; Taken from: http://is.gd/iaAo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun kmosher/increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun kmosher/decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                  (face-attribute 'default :height)))))
(global-set-key (kbd "C-+") 'kmosher/increase-font-size)
(global-set-key (kbd "C--") 'kmosher/decrease-font-size)
