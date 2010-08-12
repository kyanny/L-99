;; P22 (*) Create a list containing all integers within a given range.
;; If first argument is smaller than second, produce a list in decreasing order.
;; Example:
;; * (range 4 9)
;; (4 5 6 7 8 9)

(defun range-incr (start end)
  (cond ((= start end) (cons end nil))
        (t (cons start (range-incr (1+ start) end)))))

(range-incr 4 9)

(defun range-decr (start end)
  (cond ((= start end) (cons end nil))
        (t (cons start (range-decr (1- start) end)))))

(range-decr 9 4)

(defun range (start end)
  (cond ((< start end)
         (print start)
         (print end)
         (range-incr start end))
        (t (range-decr start end))))

(range 4 9)
(tree-equal (range 4 9)
            '(4 5 6 7 8 9))

(range 9 4)