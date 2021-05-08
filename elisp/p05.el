;; P05 (*) Reverse a list.

(defun my-reverse (list)
  (let ((newlist nil))
    (defun f (list tmp)
      (if (null list)
	  tmp
	(f (cdr list) (cons (car list) tmp))))
    (f list newlist)))
(my-reverse '(a b c d))
