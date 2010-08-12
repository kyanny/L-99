;; P21 (*) Insert an element at a given position into a list.
;; Example:
;; * (insert-at 'alfa '(a b c d) 2)
;; (A ALFA B C D)

(defun insert-at (a l n)
  (cond
    ((or (null l) (< n 1)) nil)
    ((= n 1) (cons a l))
    (t (cons (car l) (insert-at a (cdr l) (1- n))))))

(insert-at 'alfa '(a b c d) 2)
(tree-equal (insert-at 'alfa '(a b c d) 2)
            '(A ALFA B C D))

(insert-at 'alfa nil 2)
(insert-at 'alfa '(a b c d) 0)

(insert-at 'alfa '(a b c d) 5)
