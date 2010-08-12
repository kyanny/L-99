;; P19 (**) Rotate a list N places to the left.
;;     Examples:
;;     * (rotate '(a b c d e f g h) 3)
;;     (D E F G H A B C)

;;     * (rotate '(a b c d e f g h) -2)
;;     (G H A B C D E F)

;;     Hint: Use the predefined functions length and append, as well as the result of problem P17.

(defun head (l n)
  (cond ((= n 0) nil)
        (t (cons (car l) (head (cdr l) (1- n))))))

(defun tail (l n)
  (cond ((= n 0) l)
        (t (tail (cdr l) (1- n)))))

(defun rotate (l n)
  (cond ((>= n 0) (append (tail l n) (head l n)))
        (t (append (tail l (- (length l) (abs n))) (head l (- (length l) (abs n)))))))

(rotate '(a b c d e f g h) 3)
(tree-equal (rotate '(a b c d e f g h) 3)
            '(D E F G H A B C))

(rotate '(a b c d e f g h) -2)
(tree-equal (rotate '(a b c d e f g h) -2)
            '(G H A B C D E F))
