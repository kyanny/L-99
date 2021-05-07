;; P23 (**) Extract a given number of randomly selected elements from a list.
;; The selected items shall be returned in a list.
;; Example:
;; * (rnd-select '(a b c d e f g h) 3)
;; (E D A)

;; Hint: Use the built-in random number generator and the result of problem P20.

(defun remove-at (l n)
  (cond ((= n 1) (car l))
        (t (remove-at (cdr l) (1- n)))))

(defun rnd-select (l n)
  (cond ((= n 0) nil)
        (t (cons (remove-at l (1+ (random (length l)))) (rnd-select l (1- n))))))

(rnd-select '(a b c d e f g h) 3)
