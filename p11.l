;; P11  (*) Modified run-length encoding.
;;     Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

;;     Example:
;;     * (encode-modified '(a a a a b c c a a d e e e e))
;;     ((4 A) B (2 C) (2 A) D (4 E))
(defun compress-if-duplicate (n l)
  (cond ((null l)
         (cons n l))
        ((not (eq (car l) (cadr l)))
         (if (= n 1)
             (car l)
             (cons n (list (car l)))))
        (t
         (compress-if-duplicate (+ 1 n) (cdr l)))))

(defun recur-rest (l)
  (cond ((null l)
         nil)
        ((not (eq (car l) (cadr l)))
         (cdr l))
        (t
         (recur-rest (cdr l)))))

(defun encode-modified (l)
  (cond ((null l)
         nil)
        (t
         (cons (compress-if-duplicate 1 l) (encode-modified (recur-rest l))))))

(encode-modified '(a a a a b c c a a d e e e e))
(tree-equal (encode-modified '(a a a a b c c a a d e e e e))
            '((4 A) B (2 C) (2 A) D (4 E)))