;; P17  (*) Split a list into two parts; the length of the first part is given.
;;     Do not use any predefined predicates.

;;     Example:
;;     * (split '(a b c d e f g h i k) 3)
;;     ( (A B C) (D E F G H I K))
(defun take-first-part (l n)
  (cond
    ((or (= n 0) (null l))
     nil)
    (t
     (cons (car l) (take-first-part (cdr l) (1- n))))))
(take-first-part '(a b c d e f g h i k) 3)

(defun leave-lest-part (l n)
  (cond
    ((or (= n 0) (null l))
     l)
    (t
     (leave-lest-part (cdr l) (1- n)))))
(leave-lest-part '(a b c d e f g h i k) 3)

(defun split (l n)
  (list (take-first-part l n) (leave-lest-part l n)))

(split '(a b c d e f g h i k) 3)
(tree-equal (split '(a b c d e f g h i k) 3)
            '((A B C) (D E F G H I K)))