(require 'vue-mode)
(require 'emmet-mode)
(add-hook 'vue-mode-hook 'smartparens-mode)
; Indent all html by an extra 2 spaces
(setq vue-html-extra-indent 2)
(add-hook 'vue-mode-hook (lambda ()
  (setq mmm-submode-decoration-level 0)
  (emmet-mode 1)
;  This seems to die with "Marker does not point anywhere"
;;  (setq mmm-parse-when-idle t)
))

;; Vueter just isn't built for dogshit slow WSL filesystem
;(require 'lsp-mode)
;(require 'lsp-vue)
;(add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
;(require 'lsp-ui)
;(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;(require 'web-mode)
;(require 'emmet-mode)

;(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;(add-hook 'web-mode-hook (lambda ()
;  "Hook for web-mode."
;  (emmet-mode 1)
;  (setq web-mode-markup-indent-offset 2)
;  (setq web-mode-code-indent-offset 2)
;  (setq web-mode-css-indent-offset 2)
;  (setq web-mode-sql-indent-offset 4)
;))
