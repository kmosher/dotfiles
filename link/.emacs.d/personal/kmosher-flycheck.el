(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-color-mode-line)
(require 'flycheck-pos-tip)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))


(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode)
  ; Fix the puppet-parser checker for 3.8 output
  (flycheck-define-checker puppet-parser
  "A Puppet DSL syntax checker using puppet's own parser.

See URL `http://puppetlabs.com/'."
  :command ("puppet" "parser" "validate" "--color=false")
  :standard-input t
  :error-patterns
  ((error line-start "Error: Could not parse for environment "
          (one-or-more (in "a-z" "0-9" "_")) ":"
          (message) " at line " line (optional ":" column) line-end))
  :modes puppet-mode
  :next-checkers ((warning . puppet-lint)))
)

; Use popup for tty messages. Set for use with flycheck-pos-tip-mode via customize
; Code stolen from when flycheck-pos-tip-mode itself used popup
(defun kmosher-popup-flycheck-errors (errors)
  (-when-let (messages (-keep #'flycheck-error-message errors))
    (popup-tip (mapconcat 'identity messages "\n"))))

; Fix missing x-* function on OS X
; Used by pos-tip-hide
(if (not (fboundp 'x-hide-tip))
    (defun x-hide-tip ())
  )
