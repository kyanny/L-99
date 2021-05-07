;; P04 (*) Find the number of elements of a list.

(defun my-length-1 (n list)
  (if (eq (car list) nil)
      n
    (my-length-1 (+ n 1) (cdr list))))

(defun my-length (list)
  (my-length-1 0 list))

(my-length '(a b c d))
(my-length '())
(my-length '(a))
