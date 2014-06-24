;; Base16 Default (https://github.com/chriskempson/base16)
;; Scheme: Chris Kempson (http://chriskempson.com)

;; Uses the colors of base16-default-dark with extra face settings from
;; tomorrow-sanityinc

;;; base16-default-dark-extended-theme.el

;;; Code:

(deftheme kmosher-base16-default)

(let ((background "#202020")
      (current-line "#505050")
      (selection "#b0b0b0")
      (foreground "#e0e0e0")
      (comment "#b0b0b0")
      (cursor "#e0e0e0")
      (red "#ac4142")
      (orange "#d28445")
      (yellow "#f4bf75")
      (green "#90a959")
      (aqua "#75b5aa")
      (blue "#6a9fb5")
      (purple "#aa759f"))

  (custom-theme-set-faces
   'kmosher-base16-default

   ;; Built-in stuff (Emacs 23)
   `(default ((t (:background ,background :foreground ,foreground))))
   `(fringe ((t (:background ,current-line))))
   `(minibuffer-prompt ((t (:foreground ,blue))))
   `(mode-line ((t (:background ,current-line :foreground ,foreground))))
   `(region ((t (:background ,selection))))

   ;; Font-lock stuff
   `(font-lock-comment-face ((t (:foreground ,comment))))
   `(font-lock-constant-face ((t (:foreground ,green))))
   `(font-lock-doc-string-face ((t (:foreground ,comment))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,purple))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,red))))
   `(font-lock-warning-face ((t (:foreground ,red))))

   ;; hl-line-mode
   `(hl-line ((t (:background ,current-line))))

   ;; linum-mode
   `(linum ((t (:background ,current-line :foreground ,foreground))))

   ;; org-mode
   `(org-date ((t (:foreground ,purple))))
   `(org-done ((t (:foreground ,green))))
   `(org-hide ((t (:foreground ,current-line))))
   `(org-link ((t (:foreground ,blue))))
   `(org-todo ((t (:foreground ,red))))

   ;; show-paren-mode
   `(show-paren-match ((t (:background ,blue :foreground ,current-line))))
   `(show-paren-mismatch ((t (:background ,orange :foreground ,current-line))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,purple))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,aqua))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,orange))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,red))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,comment))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,foreground)))))

   ;; Flycheck
   `(flycheck-error ((t (:underline (:style wave :color ,red)))))
   `(flycheck-warning ((t (:underline (:style wave :color ,orange)))))

   ;; Magit (a patch is pending in magit to make these standard upstream)
   `(magit-branch ((t (:foreground ,green))))
   `(magit-header ((t (:inherit nil :weight bold))))
   `(magit-item-highlight ((t (:inherit highlight :background nil))))
   `(magit-log-author ((t (:foreground ,aqua))))
   `(magit-log-graph ((t (:foreground ,comment))))
   `(magit-log-sha1 ((t (:foreground ,yellow))))
   `(magit-log-head-label-bisect-bad ((t (:foreground ,red))))
   `(magit-log-head-label-bisect-good ((t (:foreground ,green))))
   `(magit-log-head-label-default ((t (:foreground ,yellow :box nil :weight bold))))
   `(magit-log-head-label-head ((t (:foreground ,orange :box nil :weight bold))))
   `(magit-log-head-label-local ((t (:foreground ,purple :box nil :weight bold))))
   `(magit-log-head-label-remote ((t (:foreground ,purple :box nil :weight bold))))
   `(magit-log-head-label-tags ((t (:foreground ,aqua :box nil :weight bold))))
   `(magit-log-head-label-wip ((t (:foreground ,blue :box nil :weight bold))))
   `(magit-process-ok ((t (:inherit success))))
   `(magit-process-ng ((t (:inherit error))))
   `(magit-section-title ((t (:foreground ,blue :weight bold))))

   ;; Search
   `(match ((t (:foreground ,blue :background ,background :inverse-video t))))
   `(isearch ((t (:foreground ,yellow :background ,background :inverse-video t))))
   `(isearch-((t lazy-highlight-face (:foreground ,aqua :background ,background :inverse-video t))))
   `(isearch-((t fail (:background ,background :inherit font-lock-warning-face :inverse-video t))))

   ;; IDO
   `(ido-subdir ((t (:foreground ,purple))))
   `(ido-firs((t t-match (:foreground ,orange))))
   `(ido-onl((t y-match (:foreground ,green))))
   `(ido-indicator ((t (:foreground ,red :background ,background))))
   `(ido-virtual ((t (:foreground ,comment))))

  (custom-theme-set-variables
   'kmosher-base16-default

   `(ansi-color-names-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground])))

(provide-theme 'kmosher-base16-default)

;;; base16-default-dark-extended.el ends here
