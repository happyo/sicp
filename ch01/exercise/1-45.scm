(load "../example/1-3-4.scm")
(load "../exercise/1-43.scm")

(define (expt base n)
  (if (= 0 n)
      1
      ((repeated (lambda (x) (* base x)) n) 1)))

(expt 2 3)

(define (average-damp-n-times f n)
  ((repeated average-damp n) f))

(define (damped-nth-root n damp-times)
  (lambda (x)
    (fix-point (average-damp-n-times
                (lambda (y) (/ x (expt y (- n 1))))
                damp-times)
               1.0)))

(define cube-root (damped-nth-root 3 1))

(cube-root 27)

(define (lg n)
  (cond ((> (/ n 2) 1)
         (+ 1 (lg (/ n 2))))
        ((< (/ n 2) 1)
         0)
        (else
         1)))

(define (nth-root n)
  (damped-nth-root n (lg n)))


((nth-root 100) 100)
