;; P13  (**) Run-length encoding of a list (direct solution).
;;     Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem P09, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.

;;     Example:
;;     * (encode-direct '(a a a a b c c a a d e e e e))
;;     ((4 A) B (2 C) (2 A) D (4 E))
(defun pack (n l)
  (cond
    ((null l)
     nil)
    ((not (eq (car l) (cadr l)))
     (cond
       ((= n 1)
        (car l))
       (t 
        (list n (car l)))))
    (t
     (pack (1+ n) (cdr l)))))
;(pack 1 '(a a a a b c c a a d e e e e))

(defun skip-until-boundary (l)
  (cond
    ((null l)
     nil)
    ((not (eq (car l) (cadr l)))
     (cdr l))
    (t
     (skip-until-boundary (cdr l)))))
;(skip-until-boundary '(a a a a b c c a a d e e e e))

(defun encode-direct (l)
  (cond
    ((null l)
     nil)
    (t
     (cons (pack 1 l) (encode-direct (skip-until-boundary l))))))

(encode-direct '(a a a a b c c a a d e e e e))
(tree-equal (encode-direct '(a a a a b c c a a d e e e e))
            '((4 A) B (2 C) (2 A) D (4 E)))