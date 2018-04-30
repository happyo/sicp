(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (add a b)
  (+ a b))

(define (mult a b)
  (* a b))

(define (sum term a next b)
  (accumulate add 0 term a next b))

(define (product term a next b)
  (accumulate mult 1 term a next b))

(define (inc x)
  (+ x 1))

(define (identity x) x)

;; b)
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a)
                                 result))))
  (iter a null-value))

(sum identity 1 inc 10)
(product identity 1 inc 5)
