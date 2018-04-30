;; gcd 206 40

;;; normal-order-evaluation
;;; gcd 40 (remainder 206 40)
;;; if (= t1 0) ; #f ; t1 = (remainder 206 40)
;;; gcd t1 (remainder 40 t1)
;;; if (= t2 0) ; #f ; t2 = (remainder 40 t1)
;;; gcd t2 (remainder t1 t2)
;;; if (= t3 0) ; #f ; t3 = (remainder t1 t2)
;;; gcd t3 (remainder t2 t3)
;;; if (= t4 0) ; #t ; t4 = (remainder t2 t3)
;;; t3
;;; (remainder t1 t2)
;;; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;; (remainder 6 (remainder 40 6))
;;; (remainder 6 4)
;;; 2

;;; applicative-order-evaluation
;;; gcd 206 40
;;; gcd 40 6
;;; gcd 6 4
;;; gcd 4 2
;;; gcd 2 0
