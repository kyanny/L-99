;; P10  (*) Run-length encoding of a list.
;;     Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

;;     Example:
;;     * (encode '(a a a a b c c a a d e e e e))
;;     ((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))

;; P09, rewrite.
(defun bundle (l)
  (cond ((or (null l) (atom l))
         nil)
        ((eq (car l) (cadr l))
         (cons (car l) (bundle (cdr l))))
        (t
         (cons (car l) nil))))

(defun skip-until-boundary (l)
  (cond ((or (null l) (atom l))
         nil)
        ((eq (car l) (cadr l))
         (skip-until-boundary (cdr l)))
        (t
         (cdr l))))

(defun pack (l)
  (cond ((or (null l) (atom l))
         nil)
        (t
         (cons (bundle l) (pack (skip-until-boundary l))))))
(pack '(a a a a b c c a a d e e e e))
(tree-equal (pack '(a a a a b c c a a d e e e e))
            '((A A A A) (B) (C C) (A A) (D) (E E E E)))


;; define encode using pack.
(defun encode (l)
  (cond ((or (null l) (atom l))
         nil)
        (t
         (cons (list (length (bundle l)) (car l))
               (encode (skip-until-boundary l))))))
(encode '(a a a a b c c a a d e e e e))
(tree-equal (encode '(a a a a b c c a a d e e e e))
            '((4 A) (1 B) (2 C) (2 A) (1 D)(4 E)))