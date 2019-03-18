(define (deriv exp var)
  (cond ((exponentiation? exp)
         (let ((n (exponent exp))
               (u (base exp)))
           (make-product n
                         (make-product (make-exponentiation u (- n 1))
                                       (deriv u var)))))
        (else "")))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else
         (list '** base exponent))))

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))

(define (exponentiation? exp)
  (and (pair? exp)
       (eq? (car exp) '**)))
