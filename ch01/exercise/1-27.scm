(load "../example/1-2-6-primality.scm")

(define (carmichael-test n)
  (carmichael-test-iter n 2))

(define (carmichael-test-iter n test)
  (cond ((= test n) #t)
        ((= test (expmod test n n))
         (carmichael-test-iter n (+ test 1)))
        (else #f)))

(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)
