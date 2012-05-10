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
(require 'column-marker)
; Highlight column 80
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))
; Show what's being selected
(transient-mark-mode 1)
; Show matching parentheses
(show-paren-mode 1)
; Line by line scrolling
(setq scroll-step 1)
(setq inhibit-startup-message t)
; Show newlines at end of file
(define-fringe-bitmap 'empty-line [0 0 #x3c #x3c #x3c #x3c 0 0])
(set-default 'indicate-empty-lines nil)

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
