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


;; 
;; 解答例のように下請け関数を二つ作る
;; 
(defun bundle (l)
  (cond ((or (null l) (atom l))
         nil)
        ((not (eq (car l) (cadr l)))
         (cons (car l) nil))
        (t
         (cons (car l) (bundle (cdr l))))))

(defun recur-tail (l)
  (cond ((or (null l) (atom l))
         nil)
        ((not (eq (car l) (cadr l)))
         (cdr l))
        (t
         (recur-tail (cdr l)))))

(defun pack (l)
  (cond ((or (null l) (atom l))
         nil)
        (t
         (cons (bundle l) (pack (recur-tail l))))))

(pack '(a a a a b c c a a d e e e e))

;; test
(tree-equal '((A A A A) (B) (C C) (A A) (D) (E E E E))
            (pack '(a a a a b c c a a d e e e e)))
