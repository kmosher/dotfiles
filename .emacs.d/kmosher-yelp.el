; use tabs in files (urgh...yelp!)
;(setq-default indent-tabs-mode t)

; tab display width of 4 columns by default
; (i'm trying everything i can think of to make this stick...)
;(setq-default tab-width 4)
; (setq-default c-basic-offset 2)
;(setq-default py-indent-offset 4)
;(setq-default py-smart-indentation nil)

(defvar smart-tabs-mode nil) ; Fix a compiler warning
(require 'smart-tabs-mode)
; Setup smart tabs. Copied from http://www.emacswiki.org/emacs/SmartTabs
(setq-default tab-width 4) ; or any other preferred value
(setq cua-auto-tabify-rectangles nil)
(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))
(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))
(defadvice indent-relative (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))
(defadvice indent-according-to-mode (around smart-tabs activate)
  (let ((indent-tabs-mode indent-tabs-mode))
	(if (memq indent-line-function
			  '(indent-relative
				indent-relative-maybe))
		(setq indent-tabs-mode nil))
	ad-do-it))

; Python specific smart tabs stuff.
(smart-tabs-advice py-indent-line py-indent-offset)
(smart-tabs-advice py-indent-region py-indent-offset)

(defun yelp-py-hook ()
  (setq 
   py-smart-indentation nil ; Don't try to guess tab width
   ; Conditional tabiness
   indent-tabs-mode (string-match "pg/yelp-main" (file-truename
												  buffer-file-name))

   smart-tabs-mode (string-match "pg/yelp-main" (file-truename
												 buffer-file-name))
   tab-width 4 ; Normal emacs tab-width
   py-indent-offset 4 ; python-mode.el setting
   ))
; A hook to load a bunch of tab stuff, with a regex guard for non-yelp non-tabbed projects
(add-hook 'python-mode-hook 'yelp-py-hook) 

; Start us where we probably want to be
(setq default-directory "~/pg/yelp-main")