;; Flatten a nested list structure.
(defun my-flatten (l)
  (cond ((null l)
         nil)
        ((atom l)
         (list l))
        (t
         (append (my-flatten (car l)) (my-flatten (cdr l))))))
(my-flatten '(a (b (c d) e)))
