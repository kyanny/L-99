;; P01 (*) Find the last box of a list.
;; Example:
;; * (my-last '(a b c d))
;; (D)

(car '(a b c))
(cdr '(a b c))
(car '(a))
(cdr '(a))

(setq list '(1))
(if (eq (cdr list) nil)
    (car list)
  -1)


(defun my-last (list)
  "Find the last box of a list."
  (if (eq (cdr list) nil)
      (car list)
    (my-last (cdr list)
	     )))

(my-last '(a b c d))
