;; Find the last but one box of a list.
(defun my-but-last (l)
  (cond ((null (cdr l))
         (cons (car l) nil))
        ((null (cddr l))
         (cons (car l) (cons (cadr l) nil)))
        (t
         (my-but-last (cdr l)))))

(my-but-last '(a b c d))

(my-but-last nil)
(my-but-last '(a))
(my-but-last '(a b))