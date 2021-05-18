;; P08 (**) Eliminate consecutive duplicates of list elements.
;; If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

;; Example:
;; * (compress '(a a a a b c c a a d e e e e))
;; (A B C A D E)

(defun compress (list)
  (if (null list)
      nil
    (if (eq
	 (car list)
	 (car (cdr list)))
	(compress (cdr list))
      (cons
       (car list)
       (compress (cdr list))))))

(compress '(a a a a b c c a a d e e e e))
