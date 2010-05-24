;; Reverse a list.
(defun my-reverse (l)
  (defun my-reverse-rec (lleft lright)
    (cond ((null lleft)
           lright)
          (t
           (my-reverse-rec
            (cdr lleft)
            (cons (car lleft) lright)))))
  (my-reverse-rec l nil))

(my-reverse '(a b c d))

(my-reverse nil)
(my-reverse '(a))