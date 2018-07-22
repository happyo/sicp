(load "../exercise/1-37.scm")

(define (e-value k)

   (define (D i)
     (if (= 0 (remainder (+ i 1) 3))
         (* 2 (/ (+ i 1) 3))
         1))

  (+ 2.0
     (cont-frac (lambda (x) 1.0)
                D
                k)))


(e-value 100)

