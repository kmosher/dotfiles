; Delight -- customise how major and minor modes appear in the ModeLine.
;  1st argument: The mode symbol.
;  2nd argument: The replacement name to use in the mode line
;                (or nil to hide it)
;  3rd argument: Either the keyword :major for
;                major modes or, for minor modes, the library which defines the
;                mode. This is passed to ‘eval-after-load’ and so should be
;                either the name (as a string) of the library file which defines
;                the mode, or the feature (symbol) provided by that library. If
;                this argument is nil, the mode symbol will be passed as the
;                feature.
;
;                In the above example, rainbow-mode is the symbol for both the
;                minor mode and the feature which provides it, and its lighter
;                text will be hidden from the mode line.
;
;                To determine which library defines a mode, use e.g.:
;                C-h f eldoc-mode RET. The name of the library is displayed in
;                the first paragraph, with an “.el” suffix (in this example it
;                displays “eldoc.el”, and therefore we could use the value
;                “eldoc” for the library).

(require 'delight)
(delight '((global-whitespace-mode nil "whitespace")
           (flyspell-mode nil "flyspell")
           (flycheck-mode nil "flycheck")
           (highlight-symbol-mode nil "highlight-symbol")
           (rainbow-mode)
           (yas-minor-mode nil "yasnippet")
           (auto-complete-mode nil "auto-complete")))
