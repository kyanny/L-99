;; P10  (*) Run-length encoding of a list.
;;     Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

;;     Example:
;;     * (encode '(a a a a b c c a a d e e e e))
;;     ((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))
(defun compress (n l)
  (cond ((null l)
         (cons n l))
        ((not (eq (car l) (cadr l)))
         (cons n (list (car l))))
        (t
         (compress (+ 1 n) (cdr l)))))

(defun recur-rest (l)
  (cond ((null l)
         nil)
        ((not (eq (car l) (cadr l)))
         (cdr l))
        (t
         (recur-rest (cdr l)))))

(defun encode (l)
  (cond ((null l)
         nil)
        (t
         (cons (compress 1 l) (encode (recur-rest l))))))

(encode '(a a a a b c c a a d e e e e))
(tree-equal (encode '(a a a a b c c a a d e e e e))
            '((4 A) (1 B) (2 C) (2 A) (1 D)(4 E)))