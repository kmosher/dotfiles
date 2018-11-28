; Setup auto-complete to steal from rope
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

; I think this is causing crazy lag for me
;(require 'company-lsp)
;(push 'company-lsp company-backends)
