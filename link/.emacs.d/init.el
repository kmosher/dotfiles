; Congratulations! You're customizing your editor

;;; Code:

; Setup package management stuff
(require 'cask "~/.cask/cask.el")
(cask-initialize)
; Pallet keeps the cask file in sync with packages
(require 'pallet)
(pallet-mode t)

; Adds all my mini-libraries in .emacs.d
(add-to-list 'load-path (concat user-emacs-directory "personal"))

; Add all the libraries under /extern
(let ((default-directory (concat user-emacs-directory "extern")))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))

; Add all the themes in /themes
(let ((default-directory (concat user-emacs-directory "themes")))
  (setq custom-theme-load-path
        (append
         (let ((custom-theme-load-path (copy-sequence custom-theme-load-path)))
           (append
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         custom-theme-load-path)))

; Language-specific enhancements
(load-library "kmosher-elisp")
(load-library "kmosher-puppet")
(load-library "kmosher-python")
(load-library "kmosher-shell")
(load-library "kmosher-yaml")

; Might as well control git with emacs too
(load-library "kmosher-git")

; Visual nicities
(load-library "kmosher-eyecandy")

; Key Rebindings
(load-library "kmosher-keymap")

; Change how emacs behaves
(load-library "kmosher-behavior")

; Auto-complete
(load-library "kmosher-ac")

; On the fly linting
(load-library "kmosher-flycheck")

; Yelp specific customizations
(load-library "kmosher-yelp")

; Cleanup mode-line clutter
(load-library "kmosher-modeline")

; Locate custom-set variables elsewhere
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; init.el ends here
