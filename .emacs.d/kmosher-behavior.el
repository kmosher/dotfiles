;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Control Emacs Default Behaviors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Store backups in their own directory instead of littering the
; whole filesystem with goddamn ~ files.
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs_backups"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

; For those heathen times when I want to scroll and click
(xterm-mouse-mode t)
(mouse-wheel-mode t)

; Why whould you ever want to leave emacs?
(require 'multi-term)
(setq multi-term-program "/bin/bash")

; Overwrite selection
(delete-selection-mode t)

; Death to trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace nil t)

(require 'uniquify)
; Uniquify buffer names. For when you have the same filname open.
(setq uniquify-buffer-name-style 'reverse)   
(setq uniquify-separator "/")   
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified   
; don't muck with special buffers (or Gnus mail buffers)
(setq uniquify-ignore-buffers-re "^\\*") 

; Spell checking
; NOTE: Flyspell mode is broken at the moment.
; (flyspell-prog-mode t)

; Smarter buffer switching similar to ^R
; TODO: NOT BEING SMART
; (setq iswitchb-mode t)
