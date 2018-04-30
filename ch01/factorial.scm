(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 3)

(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* product counter) (+ counter 1))))
  (iter 1 1))

(factorial 5)
