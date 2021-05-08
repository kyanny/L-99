;; P05 (*) Reverse a list.

(defun p05 (list)
  "Reverse a list."
  (defun f (list tmp)
    (if (null list)
	tmp
      (f (cdr list) (cons (car list) tmp))))
  (f list nil))

(p05 '(a b c d))
