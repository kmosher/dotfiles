;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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


; See https://github.com/magnars/multiple-cursors.el
(global-set-key (kbd "C-c n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c p") 'mc/mark-previous-like-this)

(global-set-key (kbd "C-c f") 'mc/mark-next-word-like-this)
(global-set-key (kbd "C-c b") 'mc/mark-previous-word-like-this)

(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C-c e") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-c m") 'mc/mark-all-dwim)

(global-set-key (kbd "C-c s") 'mc/sort-regions)
(global-set-key (kbd "C-c r") 'mc/reverse-regions)
(global-set-key (kbd "C-c 1") 'mc/insert-numbers)

; Taken from https://github.com/technomancy/better-defaults
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

; https://github.com/magnars/expand-region.el
;(require 'expand-region)
(global-set-key (kbd "C-M-SPC") 'er/expand-region)
