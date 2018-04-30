(load "../example/1-2-6-primality.scm")
(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a)
         (combiner (term a)
                   (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else
         (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (add a b)
  (+ a b))

(define (identity x) x)

(define (inc x)
  (+ x 1))

(filtered-accumulate add 0 identity 1 inc 5 odd?)

;; a)
(define (sum-prime a b)
  (filtered-accumulate add 0 identity a inc b prime?))

(sum-prime 1 10)

;; b)
(define (mult a b)
  (* a b))


(define (mult-prime n)
  (filtered-accumulate mult 1 identity 1 inc n (lambda (x) (coprime? x n)))) 

(define (coprime? i n)
  (and (< i n)
       (= 1 (gcd i n))))

(mult-prime 10)
