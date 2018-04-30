(load "../example/1-2-6-primality.scm")

(define (expmod base exp m)
  (cond ((= 0 exp)
         1)
        ((nontrivial-square-root? base m)
         0)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (nontrivial-square-root? a n)
  (and (not 1)
       (not (- n 1))
       (= 1 (remainder (square a) n))))

(define (non-zero-random n)
  (+ 1 (random (- 1 n))))

(define (Miller-Rabin-test n)
  (let ((times (ceiling (/ n 2))))
    (test-iter n times)))

(define (test-iter n times)
  (cond ((= 0 times)
         #t)
        ((= (expmod (non-zero-random n) (- n 1) n) 1)
         (test-iter n (- times 1)))
        (else
         #f)))

(Miller-Rabin-test 561)
