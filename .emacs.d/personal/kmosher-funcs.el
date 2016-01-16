; A copy of good elisp code I've written

; Function to convert csv strings to arrays
; e.g. 'foo,bar' to ['foo', 'bar']
(defun listify-logins-allowed ()
  ; Makes this show up under M-x
  (interactive)
  (save-excursion
    (while (re-search-forward "logins_allowed_by[ \t]*=>?[ \t]*'\\([a-z\_\,]*\\)'" nil t)
      (save-match-data
        (perform-replace "'" '("[" "]") nil nil nil nil nil (match-beginning 0) (match-end 0))
      )
      (save-match-data
        (perform-replace "[a-z\_]*" "'\\&'" nil t nil nil nil (match-beginning 1) (match-end 1))
        )
      (save-match-data
        (perform-replace "'prod'" "'engineer'" nil nil nil nil nil (match-beginning 1) (match-end 1))
      )

    )
    )
  (save-buffer)
)
