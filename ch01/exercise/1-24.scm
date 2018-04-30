(load "../exercise/1-22.scm")

(define (next-prime-iter n count)
  (cond ((= count 0)
         (display "are primes"))
        ((fast-prime? n 10)
         (display n)
         (newline)
         (next-prime-iter (next-odd n) (- count 1)))
        (else
         (next-prime-iter (next-odd n) count))))


(time-for-prime 10000000)
