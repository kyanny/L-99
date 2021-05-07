;; P02 (*) Find the last but one box of a list.
;; Example:
;; * (my-but-last '(a b c d))
;; (C D)

(cdr '(c d))
(cdr (cdr '(c d)))
(cdr (cdr '(d)))

(let ((list '(a b c d)))
  (car list))

(let ((list '(d)))
  (if (eq (cdr (cdr list)) nil)
      list
    t))

(defun my-but-last (list)
  "Find the last but one box of a list."
  (if (eq (cdr (cdr list)) nil)
      list
    (my-but-last (cdr list))))

(my-but-last '(a b c d))
