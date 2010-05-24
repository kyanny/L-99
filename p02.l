;; Find the last but one box of a list.
(defun my-but-last (l)
  (cond ((null (cdr l))
         (cons (car l) nil))
        ((null (cdr (cdr l)))
         (cons (car l) (cons (car (cdr l)) nil)))
        (t
         (my-but-last (cdr l)))))

(my-but-last '(a b c d))

(my-but-last nil)
(my-but-last '(a))
(my-but-last '(a b))