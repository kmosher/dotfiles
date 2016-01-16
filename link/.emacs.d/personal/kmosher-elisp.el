(add-hook 'emacs-lisp-mode-hook (lambda ()
  (unless (eq buffer-file-name nil)
	(flyspell-prog-mode))))
