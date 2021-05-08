;; P06 (*) Find out whether a list is a palindrome.
;; A palindrome can be read forward or backward; e.g. [x,a,m,a,x].

(defun p06 (list)
  (defun reverse (list)
    (defun f (list tmp)
      (if (null list)
	  tmp
	(f (cdr list) (cons (car list) tmp))))
    (f list nil))
  (defun compare (list1 list2)
    (if (and (null list1) (null list2))
	t
      (if (eq (car list1) (car list2))
	  (compare (cdr list1) (cdr list2))
	nil)))
  (compare list (reverse list)))

(p06 '(a b c d))
(p06 '(x a m a x))
(p06 '(x a m a))
