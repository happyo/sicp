(load "../example/1-3-3.scm")

(define golden-ratio
  (fix-point (lambda (x)
               (+ 1 (/ 1.0 x)))
             1.0))

golden-ratio
