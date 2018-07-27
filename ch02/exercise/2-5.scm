(define (cons a b)
  (cond ((or (< a 0) (< b 0)) (error "Number should be nonnegative"))
        (else (* (expt 2 a)
                 (expt 3 b)))))

;; 根据基本算术定理，每个正整数都可以被分解为唯一的素数相乘序列，我们可以利用这一点，通过分解 cons 计算出的整数的序列，从而复原 car 和 cdr 。
(define (car z)
  (if (= 0 (remainder z 2))
      (+ 1 (car (/ z 2)))
      0))

(define (cdr z)
  (if (= 0 (remainder z 3))
      (+ 1 (cdr (/ z 3)))
      0))
