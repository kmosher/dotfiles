;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Control Emacs Default Behaviors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Store backups in their own directory instead of littering the
; whole filesystem with goddamn ~ files.
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist ; don't litter my fs tree
    `(("." . ,(concat user-emacs-directory "backups")))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

; For those heathen times when I want to scroll and click
(xterm-mouse-mode t)
(require 'mwheel)
(mouse-wheel-mode t)

; Overwrite selection
(delete-selection-mode t)

; Death to trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace nil t)

; Show suggestions when doing completions
(ido-mode t)
(setq ido-enable-flex-matching t)

; Have appropos search more things
(setq apropos-do-all t)

(require 'uniquify)
; Uniquify buffer names. For when you have the same filname open.
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
; don't muck with special buffers (or Gnus mail buffers)
(setq uniquify-ignore-buffers-re "^\\*")

; Restore cursor position in killed buffers
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

; This handles whitespace a little better when having indentation and you kill a line.
(defadvice kill-line (after kill-line-cleanup-whitespace activate compile)
  "cleanup whitespace on kill-line"
  (if (not (bolp))
      (delete-region (point) (progn (skip-chars-forward " \t") (point)))))

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-set-key (kbd "M-/") 'auto-complete)

(require 'yasnippet)
(yas/global-mode 1)

; Add support for ag highlights
(setq ag-highlight-search t)

; Don't use tabs by default
(setq-default indent-tabs-mode nil)
