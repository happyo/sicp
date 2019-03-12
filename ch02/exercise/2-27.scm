(define (deep-reversed items)
  (define (deep-reversed-iter items result)
    (cond ((null? items) result)
          ((pair? (car items))
           (deep-reversed-iter (cdr items) (cons (deep-reversed-iter (car items) '()) result)))
          (else (deep-reversed-iter (cdr items) (cons (car items) result)))))
  (deep-reversed-iter items '()))

(define x (list (list 1 2) (list 3 4)))

(deep-reversed x)

