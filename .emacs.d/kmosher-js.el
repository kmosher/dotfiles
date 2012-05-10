; jshint flymake
(require 'flymake)
(require 'flymake-cursor)

(require 'js2-mode)

(defun flymake-jshint-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
                    'flymake-create-temp-inplace))
        (local-file (file-relative-name
                     temp-file
                     (file-name-directory buffer-file-name))))
   (list "jshint" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.js" flymake-jshint-init))

; Load flymake on non-temp buffers
(add-hook 'js2-mode-hook (lambda () (unless (eq buffer-file-name nil) (flymake-mode 1))))
