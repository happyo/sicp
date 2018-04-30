(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))
(halve 3)

(define (mult a b)
  (mult-iter a b 0))

(define (mult-iter a b count)
  (cond ((= b 0)
         count)
        ((even? b) (mult-iter (double a) (halve b) count))
        ((odd? b) (mult-iter a (- b 1) (+ a count)))))

(mult 3 4)
