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
(require 'mwheel)
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

;This handles whitespace a little better when having indentation and you kill a line.
(defadvice kill-line (after kill-line-cleanup-whitespace activate compile)
  "cleanup whitespace on kill-line"
  (if (not (bolp))
      (delete-region (point) (progn (skip-chars-forward " \t") (point)))))

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-set-key (kbd "M-/") 'auto-complete)

(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/extern/yasnippet/snippets"))
(yas/global-mode 1)

(global-set-key (kbd "C-c v") 'magit-status)
; Smarter buffer switching similar to ^R
; TODO: NOT BEING SMART
; (setq iswitchb-mode t)

(setq ruby-indent-level 4)
