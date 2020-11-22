;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual Niceties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'color-theme)
(global-font-lock-mode 1)
;(color-theme-initialize)
;(color-theme-calm-forest)

; Show column numbers on the mode line
(column-number-mode 1)

; Show what's being selected
(transient-mark-mode 1)

; Show matching parentheses
(show-paren-mode 1)

; Line by line scrolling
(setq scroll-step 1)
(setq inhibit-startup-message t)

; Displays color constants as their actual colors
;(require 'rainbow-mode)

; Show tabs and trailing whitespace
(require 'whitespace)
(setq-default fill-column 80)
(setq whitespace-style '(face tabs space-before-tab tab-mark empty trailing))
(global-whitespace-mode t)
; (setq-default show-trailing-whitespace t)
; This is like the trailing-line setting for whitespace-style
; Except it uses preprend, so it doesn't clobber other faces
(defface too-long-line
  '((t :background "gray14"))
  "Face for parts of a line that go over 80 chars."
)


(add-hook 'font-lock-mode-hook (lambda ()
 (font-lock-add-keywords nil
   `((,(format
      "^\\([^\t\n]\\{%s\\}\\|[^\t\n]\\{0,%s\\}\t\\)\\{%d\\}%s\\(.+\\)$"
      tab-width (- tab-width 1)
      (/ 80 tab-width)
      (let ((rem (% 80 tab-width)))
        (if (zerop rem)
        ""
        (format ".\\{%d\\}" rem))))
     (2 'too-long-line prepend)))
   t)
 (highlight-symbol-mode t)))
;))

(require 'highlight-symbol)
(global-set-key (kbd "C-<right>") 'highlight-symbol-next)
(global-set-key (kbd "C-<left>") 'highlight-symbol-prev)
(global-set-key [(shift meta r)] 'highlight-symbol-query-replace)
(setq-default highlight-symbol-idle-delay 0.25)

;Disable the menubar (promotes good emacs memory :)
(menu-bar-mode -1)
(tool-bar-mode -1)
;(scroll-bar-mode -1)

; Slightly prettier modeline
(powerline-default-theme)

; Pretty symbols
(global-pretty-mode t)

; Show colors as colors
;(rainbow-mode)

; Matching rainbow delimiters
;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
