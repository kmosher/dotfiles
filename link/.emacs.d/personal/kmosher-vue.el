(require 'vue-mode)
(add-hook 'vue-mode-hook 'smartparens-mode)
(add-hook 'vue-mode-hook (lambda ()
  (setq mmm-submode-decoration-level 0)
;  This seems to die with "Marker does not point anywhere"
;  (setq mmm-parse-when-idle t)
))

(require 'lsp-mode)
(require 'lsp-vue)
(add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
