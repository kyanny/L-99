;; Pack consecutive duplicates of list elements into sublists.
(defun pack (l)
  (cond ((or (null l) (null (cdr l)))
         l)
        ((eq (car l) (cadr l))
         ;(print (cdr l))
         (cons (car l) (pack (cdr l))))
        (t
         ;(print (cdr l))
         (cons (car l) (list (pack (cdr l)))))))
(pack '(a a a a b c c a a d e e e e))

;* (pack '(a a a a b c c a a d e e e e))
;((A A A A) (B) (C C) (A A) (D) (E E E E))