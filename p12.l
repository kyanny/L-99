;; P12  (**) Decode a run-length encoded list.
;;     Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.
(defun uncompress (n e)
  (cond ((= n 0)
         nil)
        (t
         (cons e (uncompress (- n 1) e)))))

(defun decode (l)
  (cond ((null l)
         nil)
        ((listp (car l))
         (let ((n (car (car l)))
               (e (cadr (car l))))
           (append (uncompress n e) (decode (cdr l)))))
        (t
         (append (list (car l)) (decode (cdr l))))))

(decode '((4 A) B (2 C) (2 A) D (4 E)))
(tree-equal (decode '((4 A) B (2 C) (2 A) D (4 E)))
            '(a a a a b c c a a d e e e e))
