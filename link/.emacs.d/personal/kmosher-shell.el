(add-hook 'shell-mode-hook (lambda ()
  (unless (eq buffer-file-name nil)
	(flyspell-prog-mode))))
