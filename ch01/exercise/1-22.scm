(load "../example/1-2-6-primality.scm")

(define (timed-prime-test n)
  (newline)
  (display n)
  (display "***")
  (display (current-milliseconds))
  (display "***")
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-milliseconds) start-time))
      (display (current-milliseconds))))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time)
  (display "***"))


;; (timed-prime-test 10000019)

(define (next-odd n)
  (if (odd? n)
      (+ n 2)
      (+ n 1)))

(define (next-three-prime n)
  (next-prime-iter n 3))

(define (next-prime-iter n count)
  (cond ((= count 0)
         (display "are primes"))
        ((prime? n)
         (display n)
         (newline)
         (next-prime-iter (next-odd n) (- count 1)))
        (else
         (next-prime-iter (next-odd n) count))))

(define (time-for-prime n)
  (let ((start-time (current-milliseconds)))
    (next-three-prime n)
    (- (current-milliseconds) start-time)))

;; (time-for-prime 1000) ;; 1.0ms

;; (time-for-prime 10000)

;; (time-for-prime 100000)

(time-for-prime 10000000) ;; 8.0ms

