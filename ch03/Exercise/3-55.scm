(load "3-50.scm")

(define (partial-sums s)
  (cons-stream (stream-car s)
               (stream-map + (partial-sums s) (stream-cdr s))))

