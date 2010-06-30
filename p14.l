;; P14 (*) Duplicate the elements of a list.
;;     Example:
;;     * (dupli '(a b c c d))
;;     (A A B B C C C C D D)
(defun dupli (l)
  (cond
    ((null l)
     nil)
    (t
     (append (list (car l) (car l)) (dupli (cdr l))))))

(dupli '(a b c c d))
(tree-equal (dupli '(a b c c d))
            '(A A B B C C C C D D))