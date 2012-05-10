; A more civilized python for a more civilized age!
; XXX Dead as of a python-mode.el upgrade
;(require 'ipython)

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

; Adaptaive line wrapping
;(require 'adaptive-wrap-prefix)

;(add-hook 'python-mode-hook
;	  (lambda () (srb-adaptive-wrap-mode t)))

; Pyflakes on the fly with flymake
(require 'flymake)
(require 'flymake-cursor)

(defun flymake-pylint-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
                    'flymake-create-temp-inplace))
        (local-file (file-relative-name
                     temp-file
                     (file-name-directory buffer-file-name))))
   (list "pychecker" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pylint-init))

; Load flymake on non-temp buffers
(add-hook 'python-mode-hook (lambda ()
  (unless (eq buffer-file-name nil) (flymake-mode 1))))


; Befier source checking
(setq py-pychecker-command "epylint")
(setq py-pychecker-command-args nil)

; Lookup python docs with pylookup (http://taesoo.org/Opensource/Pylookup)
;(setq pylookup-dir "~/emacs.d/pylookup")
;(add-to-list 'load-path pylookup-dir)
;; load pylookup when compile time
;(eval-when-compile (require 'pylookup))

;; set executable file and db file
;(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
;(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; to speedup, just load it on demand
;(autoload 'pylookup-lookup "pylookup"
;  "Lookup SEARCH-TERM in the Python HTML indexes." t)
;(autoload 'pylookup-update "pylookup" 
;  "Run pylookup-update and create the database at `pylookup-db-file'." t)

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
