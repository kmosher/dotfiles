;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Changes to the default key behavior
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Up-down arrows will cycle through history
(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

(setq comint-completion-autolist t ;list possibilities on partial
				   ;completion
      comint-completion-recexact nil ;use shortest compl. if
				     ;characters cannot be added
)

; Convenient multiterm functions
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one

;Make page up and page down a whole lot nicer
;(global-set-key "\C-v"	   'pager-page-down)
;(global-set-key [next] 	   'pager-page-down)
;(global-set-key "\ev"	   'pager-page-up)
;(global-set-key [prior]	   'pager-page-up)
;(global-set-key '[M-up]    'pager-row-up)
;(global-set-key '[M-kp-8]  'pager-row-up)
;(global-set-key '[M-down]  'pager-row-down)
;(global-set-key '[M-kp-2]  'pager-row-down)
