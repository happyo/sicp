;; b^n = b^(n - 1) * b
;; b^0 = 1

;;; linear recursive
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
(expt 2 3)

;;; linear iterative
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b (- counter 1) (* b product))))

(expt 2 3)

;;; fast
(define (square x)
  (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(fast-expt 2 3)
