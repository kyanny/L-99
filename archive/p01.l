;; Find the last box of a list.
(defun my-last (l)
  (cond ((null (cdr l))
         (car l))
        (t
         (my-last (cdr l)))))

(my-last '(a b c d))
(my-last nil)