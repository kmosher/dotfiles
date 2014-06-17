; Congratulations! You're customizing your editor
; Adds all my mini-libraries in .emacs.d
(add-to-list 'load-path user-emacs-directory)

; Setup package management stuff
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

; Add all the libraries under /extern
(let ((default-directory "~/.emacs.d/extern/"))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))


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

; Cleanup mode-line clutter
(load-library "kmosher-diminish")

; Auto-complete
(load-library "kmosher-ac")

; On the fly linting
(load-library "kmosher-flycheck")


; Yelp specific customizations
(load-library "kmosher-yelp")

; Locate custom-set variables elsewhere
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
