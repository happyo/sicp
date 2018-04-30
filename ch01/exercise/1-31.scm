;; a)
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (identity x)
  x)

(define (inc x)
  (+ x 1))

(define (factorial n)
  (product identity 1 inc n))

;; (factorial 4)

(define (numerator-term n)
  (cond ((= n 1) 2)
        ((even? n) (+ n 2))
        (else (+ n 1))))

(define (denominator-term n)
  (cond ((odd? n) (+ n 2))
        (else (+ n 1))))

(define (pi-term n)
  (/ (numerator-term n)
     (denominator-term n)))

(define (pi-product n)
  (* 4
     (product pi-term 1 inc n)))


;; b)
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

;; (factorial 4)
(pi-product 10000)
