(+ 1 2)

(define size 2)

(* 5 size)

(define (square x) (* x x))

(square 3)

(define (sum-of-squares x y)
  (+ (square x) (square y))
  )

(sum-of-squares 1 2) 

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 2)

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))
        ))

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)
        )
  )

(define (abs x)
  (if (< x 0)
      (- x)
      x)
  )

(abs 10)

;; 1.2

(/ (+ 5
      (+ 4
         (- 2
            (- 3
               (+ 6
                  (/ 4 5))))))
   (* 3
      (* (- 6 2) (- 2 7)))
)

;; 1.3

(define (sum-three a b c)
  (if (> a b)
      (if (> b c)
          (sum-of-squares a b)
          (sum-of-squares a c))
       (if (> a c)
          (sum-of-squares b a)
          (sum-of-squares b c))
      ))

(sum-three 5 2 3)

;; 1.4

;; 该函数返回 a + |b|

;; 1.5

;; normal order

;;(if (= 0 0)
;0
;    (p))

;0

;; applicative order

;; 卡死在(p) 的解析上


                                        ; 牛顿方法求平方根

(define (sqrt-iter guess x)
  (if (good-enough? guess (imrove guess x))
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (x +  y) 2))

(define (good-enough? old-guess new-guess)
  (< (/ (abs (- old-guess new-guess)) old-guess) 0.001))

(define (sqrt x)
  (sqrt-iter 1 x))


;; 1.7

;;;当数字太小时精度不足以显示正确，当数字太大时接近值之差会大于精度，导致无限循环

;; 1.8

(define (cube-iter guess x)
  (if (good-enough? guess (cube-improve guess x))
      guess
      (cube-iter (cube-improve guess x)
                 x)))

(define (cube x)
  (* (* x x) x))

(define (cube-improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess))
   3))

(cube-improve 1.0 8)

(define (cube-root x)
  (cube-iter 1.0 x))

(cube-root (cube 2))
                                        ; -----------------------------------------------------
                                        ; block structure

(define (sqrt x)
  (define (good-enough? guess x)
    (< (/ (abs (- (square guess) x)) x) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x)
  )

(sqrt 9)

;; lexical scoping

(define (sqrt x)
  (define (good-enough? guess)
    (< (/ (abs (- (square guess) x)) x) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x)
  )

(sqrt 9)
                                        ; -----------------------------------------------------
;; 1.9
;;; 第一个
(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;;; 第二个
(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
                                        ; -----------------------------------------------------
;; 1.10
;;; (f n) = (A 0 n) = 2n
;;; (g n) = (A 1 n) = 2^n
;;; (h n) = (A 2 n) = 2 ^ 2 ^ 2 (n 个 2次方)
                                        ; -----------------------------------------------------
                                        ; Tree Recursion

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)

                                        ; -----------------------------------------------------

;; 1.11

;;; recursive process
(define (r-f n)
  (if (< n 3)
      n
      (+ (r-f (- n 1))
         (* 2 (r-f (- n 2)))
         (* 3 (r-f (- n 3)))
         )))

(r-f 8)
;;; iterative process
(define (i-f n)
  (f-iter n 2 1 0))

(define (f-iter n count1 count2 count3)
  (if (< n 3)
      count1
      (f-iter (- n 1) (+ count1 (* 2 count2) (* 3 count3)) count1 count2)))

(i-f 8)

                                        ; -----------------------------------------------------

;; 1.12

(define (parscal row col)
  (if (is-not-edge row col)
      (+ (parscal (- row 1) (- col 1))
         (parscal (- row 1) col))
      1))

(define (is-not-edge row col)
  (and (> col 0) (< col (- (number-of-col row) 1)))
  )

(define (number-of-col row)
  (+ row 1))

(parscal 4 2)
                                        ; -----------------------------------------------------
                                        ; -----------------------------------------------------
                                        ; -----------------------------------------------------
                                        ; -----------------------------------------------------
                                        ; -----------------------------------------------------
                                        ; -----------------------------------------------------
