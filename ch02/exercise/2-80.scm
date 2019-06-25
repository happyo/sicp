(load "../example/generic-arithmetic.scm")

(define (=zero? x) (apply-generic '=zero? x))

// scheme number
(put '=zero? '(scheme-number)
     (lambda (x) (= x 0)))

// rational
(put '=zero? '(rational)
     (lambda (x) (= 0 (numer x))))

// complex
(put '=zero? '(complex)
     (lambda (x)
       (and (= (real-part x) 0)
            (= (imag-part x) 0))))
