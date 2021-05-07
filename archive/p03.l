;; Find the K'th element of a list.
(defun element-at (l nth)
  (cond ((or (< nth 0) (> nth (length l)))
         nil)
        ((= (1- nth) 0)
         (car l))
        (t
         (element-at (cdr l) (1- nth)))))
        
(element-at '(a b c d e) 3)

(element-at '(1 2 3 4 5 6 7 8 9 10) 0)
(element-at '(1 2 3 4 5 6 7 8 9 10) -1)
(element-at '(1 2 3 4 5 6 7 8 9 10) 11)
