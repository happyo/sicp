(define (cube x)
  (* x x x))
 
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

;; (* 8 (pi-sum 1 10000))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n)
  (+ n 1))

(define (sum-cubes-new a b)
  (sum cube a inc b))

;; (sum-cubes-new 1 5)
;; (sum-cubes 1 5)

(define (identity x)
  x)

(define (sum-integers-new a b)
  (sum identity a inc b))

;; (sum-integers-new 1 5)

(define (pi-sum-new a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

;; (* 8 (pi-sum-new 1 10000))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;; (integral cube 0 1 0.0001)
