(load "../exercise/1-37.scm")

(define (tan-cf x k)

  (define (n k)
    (if (= 1 k)
        x
        (- (* x x))))

  (define (d k)
    (- (* 2 k) 1))

  (cont-frac n d k))


(tan-cf 10 100)
