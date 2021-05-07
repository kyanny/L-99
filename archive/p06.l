;; Find out whether a list is a palindrome.
(defun palindrome? (l)
  ;; Reverse a list.
  (defun my-reverse (l)
    (defun my-reverse-rec (lleft lright)
      (cond ((null lleft)
             lright)
            (t
             (my-reverse-rec
              (rest lleft)
              (cons (first lleft) lright)))))
    (my-reverse-rec l nil))
  (defun palindrome?-rec (lleft lright)
    (cond ((and (null lleft) (null lright))
           t)
          ((eq (first lleft) (first lright))
           t)
          (t
           (palindrome?-rec (rest lleft) (rest lright)))))
  (let ((lreverse (my-reverse l)))
    (palindrome?-rec l lreverse)))

(palindrome? '(x a m a x))
