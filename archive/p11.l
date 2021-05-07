;; P11  (*) Modified run-length encoding.
;;     Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

;;     Example:
;;     * (encode-modified '(a a a a b c c a a d e e e e))
;;     ((4 A) B (2 C) (2 A) D (4 E))
(defun bundle (l)
  (cond
    ((or (null l) (atom l))
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

(defun encode-modified (l)
  (cond
    ((or (null l) (atom l))
     nil)
    ((eq 1 (length (bundle l)))
     (cons (car l) (encode-modified (skip-until-boundary l))))
    (t
     (cons (list (length (bundle l)) (car l))
           (encode-modified (skip-until-boundary l))))))

(encode-modified '(a a a a b c c a a d e e e e))
(tree-equal (encode-modified '(a a a a b c c a a d e e e e))
            '((4 A) B (2 C) (2 A) D (4 E)))
