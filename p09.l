;; Pack consecutive duplicates of list elements into sublists.

;; * (pack '(a a a a b c c a a d e e e e))
;; ((A A A A) (B) (C C) (A A) (D) (E E E E))

(defun pack (l)
  (defun pack-rec (acc lst)
    (cond ((null lst)
           acc)
          ((null (cdr lst))
           (list (cons (car lst) acc)))
          ((not (eq (car lst) (cadr lst)))
           (cons (cons (car lst) acc) (pack-rec nil (cdr lst))))
          (t
           (pack-rec (cons (car lst) acc) (cdr lst)))))
  (pack-rec nil l))

(pack '(a a a a b c c a a d e e e e))

;; test
(tree-equal '((A A A A) (B) (C C) (A A) (D) (E E E E))
            (pack '(a a a a b c c a a d e e e e)))