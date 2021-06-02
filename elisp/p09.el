;; P09 (**) Pack consecutive duplicates of list elements into sublists.
;; If a list contains repeated elements they should be placed in separate sublists.

;; Example:
;; * (pack '(a a a a b c c a a d e e e e))
;; ((A A A A) (B) (C C) (A A) (D) (E E E E))

(defun pack3 (new sublist x)
  (cond ((null x) (if (null sublist)
		      new
		    (append new (list sublist))
		    ))
	((null sublist) (pack3 new (cons (car x) sublist) (cdr x)))
	((eq (car sublist) (car x)) (pack3 new (cons (car x) sublist) (cdr x)))
	(t (pack3 (append new (list sublist)) nil x))
	)
  )

(defun pack (x)
  (pack3 nil nil x))

(setq edebug-trace t)
(pack3 nil nil '(a a a a b c c a a d e e e e))
(pack '(a a a a b c c a a d e e e e))
