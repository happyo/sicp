(load "../example/1-2-6-primality.scm")
(load "../exercise/1-22.scm")

(define (next n)
  (if (= n 2)
      3
      (+ 2 n)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(time-for-prime 10000000)
