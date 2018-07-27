(define make-segment cons)

(define start-point car)

(define end-point cdr)

(define make-point cons)

(define x-point car)

(define y-point cdr)

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment segment)
  (let ((start (start-point segment))
        (end (end-point segment)))
    (make-point (average (x-point start) (y-point end))
                (average (y-point start) (y-point end)))))

(define point-one (make-point 1 1))

(define point-two (make-point 5 5))

(define segment (make-segment point-one point-two))

(define (average x y)
  (/ (+ x y) 2.0))

(print-point (midpoint-segment segment))
