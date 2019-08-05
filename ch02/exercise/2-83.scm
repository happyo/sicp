(load "../example/generic-arithmetic.scm")

(define (integer-rational n)
  (make-rational n 1))
(put 'raise '(integer)
     (lambda (i) (integer-rational i)))

;; (define (rational-real n)
;;   ())
