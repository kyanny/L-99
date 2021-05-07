;; P25 (*) Generate a random permutation of the elements of a list.
;; Example:
;; * (rnd-permu '(a b c d e f))
;; (B A D C E F)

;; Hint: Use the solution of problem P23.

(defun remove-at (l n)
  (cond ((= n 1) (car l))
        (t (remove-at (cdr l) (1- n)))))

(defun rnd-select (l n)
  (cond ((= n 0) nil)
        (t (cons (remove-at l (1+ (random (length l)))) (rnd-select l (1- n))))))

(defun rnd-permu (l)
  (rnd-select l (length l)))

(rnd-permu '(a b c d e f))