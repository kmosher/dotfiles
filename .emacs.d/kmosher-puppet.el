(require 'puppet-mode)
(setq puppet-indent-level 2)

(define-key puppet-mode-map (kbd "C-c '") 'puppet-toggle-string-quotes)
