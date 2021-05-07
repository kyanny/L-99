;; P16  (**) Drop every N'th element from a list.
;;     Example:
;;     * (drop '(a b c d e f g h i k) 3)
;;     (A B D E G H K)
(defun drop (l n)
  (cond
    ((null l)
     nil)
    ((= (mod (1- n) 3) 0)
     (drop (cdr l) (1- n)))
    (t
     (cons (car l) (drop (cdr l) (1- n))))))

(drop '(a b c d e f g h i k) 3)
(tree-equal (drop '(a b c d e f g h i k) 3)
            '(A B D E G H K))