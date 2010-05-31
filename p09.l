;; Pack consecutive duplicates of list elements into sublists.

;; こーいう形になればよい
(cons '(a b) (cons '(a b) (cons '(a b) nil)))
(cons l (cons l (cons l nil)))
(cons (pack '(a b)) (cons (pack '(a b)) (cons (pack '(a b)) nil)))

(defun bundle-sublist (l-rest l-accum)
  (cond
    ((or (null l-rest) (null (cdr l-rest)))
     l-rest)
    ((not (eq (car l-rest) (cadr l-rest)))
     (append l-accum (list (car l-rest))))
    (t
     (bundle-sublist (cdr l-rest) (append l-accum (list (car l-rest)))))))
(bundle-sublist '(a a a b b c) nil)

(defun bundle (l)
  (cond
    ((null l)
     l)
    ((null (cdr l))
     (list l))
    ((not (eq (car l) (cadr l)))
     ;(cons (bundle-sublist l nil) (bundle (cdr l))))
     (bundle (cdr l)))
    (t
     ;(cons (car l) (bundle (cdr l))))))
     (cons (bundle-sublist l nil) (bundle (cdr l))))))
(bundle '(a a a a b b c));=> ((A A A) (A A) (B B) (C))

;;
(defun pack (l)
  (cond ((or (null l) (null (cdr l)))
         l)
        ((eq (car l) (cadr l))
         ;(print (cdr l))
         (cons (car l) (pack (cdr l))))
        (t
         ;(print (cdr l))
         (cons (car l) (list (pack (cdr l)))))))
(pack '(a a a a b c c a a d e e e e))

;* (pack '(a a a a b c c a a d e e e e))
;((A A A A) (B) (C C) (A A) (D) (E E E E))