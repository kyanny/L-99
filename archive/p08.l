;; Eliminate consecutive duplicates of list elements.
(defun compress (l)
  (cond ((null l)
         nil)
        ((null (cdr l))
         l)
        ((eq (car l) (cadr l))
         (compress (cdr l))
         )
        (t
         (cons (car l) (compress (cdr l))))))
(compress '(a a a a b c c a a d e e e e))