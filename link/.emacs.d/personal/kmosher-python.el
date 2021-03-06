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


; Load flyspell on non-temp buffers
(add-hook 'python-mode-hook (lambda ()
  (unless (eq buffer-file-name nil)
    (flyspell-prog-mode))))


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
