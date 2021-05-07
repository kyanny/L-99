;; P03 (*) Find the K'th element of a list.
;; The first element in the list is number 1.
;; Example:
;; * (element-at '(a b c d e) 3)
;; C

(let ((list '(a b c d e))
      (n 0))
  ]\\\\\\\\






































































































m,,,,,,,,,,,,,,,kkkkkkkkkkkkkkkk


(let ((list '(a b c d e))
      (n 0))
  (if (eq (car list) nil)
      n
    (+ 1 n)))
      

(defun element-at (list nth)
  (if (eq nth 1)
      (car list)
    (element-at (cdr list) (- nth 1))))

(element-at '(a b c d e) 3)
