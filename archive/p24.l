;; P24 (*) Lotto: Draw N different random numbers from the set 1..M.
;; The selected numbers shall be returned in a list.
;; Example:
;; * (lotto-select 6 49)
;; (23 1 17 33 21 37)

;; Hint: Combine the solutions of problems P22 and P23.
(defun range-incr (start end)
  (cond ((= start end) (cons end nil))
        (t (cons start (range-incr (1+ start) end)))))

(defun range-decr (start end)
  (cond ((= start end) (cons end nil))
        (t (cons start (range-decr (1- start) end)))))

(defun range (start end)
  (cond ((< start end)
         (print start)
         (print end)
         (range-incr start end))
        (t (range-decr start end))))

(defun remove-at (l n)
  (cond ((= n 1) (car l))
        (t (remove-at (cdr l) (1- n)))))

(defun rnd-select (l n)
  (cond ((= n 0) nil)
        (t (cons (remove-at l (1+ (random (length l)))) (rnd-select l (1- n))))))

(defun lotto-select (n m)
  (rnd-select (range 1 m) n))

(lotto-select 6 49)
