(defun my-last (l)
  (cons (car (reverse l)) nil))

(my-last '(a b c d))

(equal (my-last '(a b c d)) '(d))

