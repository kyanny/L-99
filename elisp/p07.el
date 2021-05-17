;; P07 (**) Flatten a nested list structure.
;; Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

;; Example:
;; * (my-flatten '(a (b (c d) e)))
;; (A B C D E)

;; Hint: Use the predefined functions list and append.

(defun flatten (list)
  (if (null list)
      (progn
	(message "return nil")
	nil)
    (if (atom list)
	(progn
	  (message "return %s" (list list))
	   (list list))
      (let ((a (flatten (car list)))
	    (b (flatten (cdr list))))
	(progn
	  (message "a=%s" a)
	  (message "b=%s" b)
	  (append a b))))))
;       (flatten (car list)) (flatten (cdr list))))))

(flatten '(a (b (c d) e)))

;; Got answer from https://stackoverflow.com/questions/10465096/flatten-nests-function-in-lisp-need-help-understanding
;; No understanding :(
