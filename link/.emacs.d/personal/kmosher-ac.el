; Setup auto-complete to steal from rope
(require 'company)
(require 'company-web-html)
(add-hook 'after-init-hook 'global-company-mode)
(define-key vue-mode-map (kbd "C-'") 'company-web-html)

; I think this is causing crazy lag for me
;(require 'company-lsp)
;(push 'company-lsp company-backends)
