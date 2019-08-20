(load "Stream.scm")

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (random-update x))
      x)))

(define random-numbers
  (cons-stream
   random-init
   (stream-map random-update random-numbers)))


;; A functional-programming view of time

(define (stream-withdraw balance amount-stream)
  (cons-stream
   balance
   (stream-withdraw (- balance (stream-car amount-stream))
                    (stream-cdr amount-stream))))
