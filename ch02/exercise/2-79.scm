(load "../example/generic-arithmetic.scm")

(define (equ? x y) (apply-generic 'equ? x y))

// scheme number
(put 'equ? '(scheme-number scheme-number)
     (lambda (x y) (= x y)))

// rational
(define (equal-rat? x y)
  (and
   (= (numer x) (numer y))
   (= (denom x) (denom y))))
(put 'equ? '(rational rational)
     (lambda (x y) (equal-rat? x y)))

// complex
(define (equal-complex? x y)
  (and
   (= (real-part x) (real-part y))
   (= (imag-part x) (imag-part y))))

(put 'equ? '(complex complex)
     (lambda (x y) (equal-complex? x y)))
