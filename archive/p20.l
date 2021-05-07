;; P20 (*) Remove the K'th element from a list.
;; Example:
;; * (remove-at '(a b c d) 2)
;; (A C D)

(defun remove-at (l n)
  (cond
    ((or (null l) (< n 1)) nil)
    ((< (length l) n) l)
    ((= 1 n) (cdr l))
    (t (cons (car l) (remove-at (cdr l) (1- n))))))

(remove-at '(a b c d) 2)
(tree-equal (remove-at '(a b c d) 2)
            '(A C D))

(remove-at '() 2)
(remove-at '(a b c d) 0)
(remove-at '(a b) 3)