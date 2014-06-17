; Congratulations! You're customizing your editor
; Adds all my mini-libraries in .emacs.d
(add-to-list 'load-path user-emacs-directory)

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
(load-library "kmosher-python")
(load-library "kmosher-shell")
(load-library "kmosher-elisp")
(load-library "kmosher-puppet")
;(load-library "kmosher-java")

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

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

; Yelp specific customizations
(load-library "kmosher-yelp")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((python-indent . 4) (sh-indent-comment . t)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-candidate-face ((t (:background "gray5"))))
 '(ac-selection-face ((t (:background "gray8" :foreground "white"))))
 '(column-marker-1 ((t (:background "gray10"))))
 '(highlight-symbol-face ((((class color) (background dark)) (:background "gray20")) (((class color) (background light)) (:background "gray90"))))
 '(region ((t (:background "#120"))))
 '(whitespace-tab ((t (:foreground "gray19")))))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
