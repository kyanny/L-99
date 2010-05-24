;; Find the last but one box of a list.
(defun my-but-last (l)
  (reverse
   (list
    (first (reverse l))
    (second (reverse l)))))

(my-but-last '(a b c d))

(equal (my-but-last '(a b c d)) '(c d))
