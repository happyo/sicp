(define (cont-frac n d k)

  (define (recurse-cf i)
    (if (= k i)
        (/ (n i)
           (d i))
        (/ (n i)
           (+ (d i) (recurse-cf (+ i 1))))))

  (recurse-cf 1))


(cont-frac (lambda (x) 1.0)
           (lambda (x) 1.0)
           100)

(define (cont-frac n d k)

  (define (iter-cf i result)
    (if (= i 0)
        result
        (iter-cf (- i 1)
                 (/ (n i)
                    (+ (d i) result)))))

  (iter-cf (- k 1)
           (/ (n k) (d k))))

(cont-frac (lambda (x) 1.0)
           (lambda (x) 1.0)
           9)
