; Emacs has TWO competing python modes, talk about confusing
; this is the one maintained by the python community
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

; Fix shitty handling of _
(add-hook 'python-mode-hook (lambda ()
  (define-key py-mode-map [(meta f)] 'py-forward-into-nomenclature)
  (define-key py-mode-map [(meta b)] 'py-backward-into-nomenclature))
)

; Pyflakes on the fly with flymake
(require 'flymake)
(require 'flymake-cursor)

(defun flymake-pylint-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
                    'flymake-create-temp-inplace))
        (local-file (file-relative-name
                     temp-file
                     (file-name-directory buffer-file-name))))
   (list "flake8" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pylint-init))

; Load flymake and flyspell on non-temp buffers
(add-hook 'python-mode-hook (lambda ()
  (unless (eq buffer-file-name nil)
    (flymake-mode t)
    (flyspell-prog-mode))))


; Setup auto-complete to steal from rope
(require 'auto-complete)
(require 'auto-complete-config)

; Beefier source checking
(setq py-pychecker-command "epylint")
(setq py-pychecker-command-args nil)

; Setup ipython and get colors working. TAB completion is broke. Might want to
; look into upgrading python-mode to fix this
(setq-default py-shell-name "ipython")
(setq ansi-color-for-comint-mode t)

;; Detect if inside triple quote or comment
(defsubst python-in-comment()
    (nth 4 (syntax-ppss))
)

;; Autofill inside of comments
(defun python-auto-fill-comments-only ()
  (auto-fill-mode 1)
  (set (make-local-variable 'fill-nobreak-predicate)
       (lambda ()
         (not (python-in-comment)))))

(add-hook 'python-mode-hook
          (lambda ()
            (python-auto-fill-comments-only)))
