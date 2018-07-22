(load "../exercise/1-43.scm")

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

(define (n-fold f n)
  (let ((n-time-smooth (repeated smooth n)))
    (n-time-smooth f)))


((smooth square) 5)

((n-fold square 10) 5)
