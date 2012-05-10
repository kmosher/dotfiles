; Congratulations! You're customizing your editor
; Adds all my mini-libraries in .emacs.d
(add-to-list 'load-path user-emacs-directory)

; Add all the libraries under /extern
(let ((default-directory "~/.emacs.d/extern/"))
  (setq load-path
		(append
		 (let ((load-path (copy-sequence load-path))) ;; Shadow
		   (append 
			(copy-sequence (normal-top-level-add-to-load-path '(".")))
			(normal-top-level-add-subdirs-to-load-path)))
		 load-path)))

;; ; Third party libraries are stored in ~/.emacs.d/extern
;; (let ((default-directory "~/.emacs.d/extern"))
;;   (normal-top-level-add-to-load-path '("."))

;; (progn (cd "~/.emacs.d/extern")
;;        (normal-top-level-add-subdirs-to-load-path))

; Language-specific enhancements
(load-library "kmosher-python")
;(load-library "kmosher-java")

; Might as well control git with emacs too
(load-library "kmosher-git")

; Visual nicities
(load-library "kmosher-eyecandy")

; Key Rebindings
(load-library "kmosher-keymap")

; Change how emacs behaves
(load-library "kmosher-behavior")

; CEDET custimizations
; (load-library "kmosher-cedet")

; Yelp specific customizations
(load-library "kmosher-yelp")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-auto-activate t)
 '(ecb-create-layout-file "~/.emacs.d/ecb-user-layouts.el")
 '(ecb-create-layout-frame-height 35)
 '(ecb-layout-name "top-kmosher")
 '(ecb-layout-window-sizes (quote (("top-kmosher" (0.23529411764705882 . 0.19642857142857142) (0.21176470588235294 . 0.19642857142857142) (0.5529411764705883 . 0.19642857142857142)))))
 '(ecb-major-modes-show-or-hide (quote (nil)))
 '(ecb-options-version "2.40")
 '(ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\|pyc\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
 '(ecb-source-path (quote (("~/pg/yelp-main/" "yelp-main"))))
 '(ecb-sources-sort-method (quote name))
 '(ecb-use-speedbar-instead-native-tree-buffer nil)
 '(ecb-windows-height 0.2)
 '(jde-jdk-registry (quote (("1.6.0" . "/usr/lib/jvm/java-6-sun/"))))
 '(safe-local-variable-values (quote ((sh-indent-comment . t)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:foreground "gray19"))))
 '(column-marker-1 ((t (:background "gray10"))))
 '(whitespace-line ((t (:background "gray10"))))
)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
	(load
	 (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
