(load "../example/1-3-3.scm")

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fix-point (average-damp (lambda (y) (/ x y)))
             1.0))

;; (sqrt 4)

(define (cube-root x)
  (fix-point (average-damp (lambda (y) (/ x (* y y))))
             1.0))

;; (cube-root 27)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))

(define dx 0.00001)

(define (cube x)
  (* x x x))

((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (newton-method g guess)
  (fix-point (newton-transform g) guess))

(define (sqrt-new x)
  (newton-method (lambda (y) (- (* y y) x))
                 1.0))

(sqrt-new 4)

(define (fixed-point-of-transform g transform guess)
  (fix-point (transform g) guess))

(define (sqrt-t x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(sqrt-t 4)

