;; P15  (**) Replicate the elements of a list a given number of times.
;;     Example:
;;     * (repli '(a b c) 3)
;;     (A A A B B B C C C)
(defun repli1 (a n)
  (cond
    ((= n 0)
     nil)
    (t
     (cons a (repli1 a (1- n))))))
(repli1 'a 3)

(defun repli (l n)
  (cond
    ((null l)
     nil)
    (t
     (append (repli1 (car l) n) (repli (cdr l) n)))))

(repli '(a b c) 3)
(tree-equal (repli '(a b c) 3)
            '(A A A B B B C C C))