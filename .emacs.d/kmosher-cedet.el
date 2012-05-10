; Load File
(load-file "~/.emacs.d/extern/cedet-1.0/common/cedet.el")

; Load the emacs code-browser
(require 'ecb)
(require 'semantic-ia)

;; (these commands are listed in increasing order, and each command include
;; features of previous commands):
;;
;; semantic-load-enable-minimum-features — enables only minimum of necessary
;; features — keep syntactic information for current buffer up-to date, storing
;; of syntactic information for later use (Semanticdb), and loading of
;; corresponding information with Semanticdb and Ebrowse;
;;
;; semantic-load-enable-code-helpers — enables senator-minor-mode for navigation
;; in buffer, semantic-mru-bookmark-mode for storing positions of visited tags,
;; and semantic-idle-summary-mode, that shows information about tag under point;
;;
;; semantic-load-enable-gaudy-code-helpers — enables semantic-stickyfunc-name
;; that displays name of current function in topmost line of buffer,
;; semantic-decoration-mode to decorate tags, using different faces, and
;; semantic-idle-completion-mode for automatic generation of possible names
;; completions, if user stops his work for some time;
;;
;; semantic-load-enable-excessive-code-helpers — enables which-func-mode, that
;; shows name of current function in status line;
;;
;; semantic-load-enable-semantic-debugging-helpers — enables several modes, that
;; are useful when you debugging Semantic — displaying of parsing errors, its
;; state, etc.
(semantic-load-enable-gaudy-code-helpers)
; I don't like these overwriting flymake-cursor
(semantic-idle-summary-mode -1)
(semantic-idle-completions-mode -1)
;;TODO: Add this to the jde mode hook
;(global-semantic-idle-tag-highlight-mode 1)