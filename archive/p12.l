;; P12  (**) Decode a run-length encoded list.
;;     Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.
(defun unpack (l)
  (cond
    ((= 0 (car l))
     nil)
    (t
     (cons (cadr l)
           (unpack (list (1- (car l)) (cadr l)))))))
;(unpack '(4 A))

(defun decode (l)
  (cond
    ((null l)
     nil)
    ((atom (car l))
     (cons (car l) (decode (cdr l))))
    (t
     (append (unpack (car l)) (decode (cdr l))))))

(decode '((4 A) B (2 C) (2 A) D (4 E)))
(tree-equal (decode '((4 A) B (2 C) (2 A) D (4 E)))
            '(a a a a b c c a a d e e e e))
