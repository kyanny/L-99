;; P18  (**) Extract a slice from a list.
;;     Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

;;     Example:
;;     * (slice '(a b c d e f g h i k) 3 7)
;;     (C D E F G)
(defun take-precede-part (l n)
  (cond
    ((or (= n 0) (null l))
     nil)
    (t
     (cons (car l) (take-precede-part (cdr l) (1- n))))))
(take-precede-part '(a b c d e f g h i k) 7)

(defun take-follow-part (l n)
  (cond
    ((or (= n 0) (null l))
     l)
    (t
     (take-follow-part (cdr l) (1- n)))))
(take-follow-part '(a b c d e f g h i k) 2)

(defun slice (l i k)
  (cond
    ((null l)
     nil)
    ((= i 0)
     nil)
    ((= k 0)
     nil)
    (t
     (take-follow-part (take-precede-part l k) (1- i)))))

(slice '(a b c d e f g h i k) 3 7)
(tree-equal (slice '(a b c d e f g h i k) 3 7)
            '(C D E F G))