(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (cons (square (car things))
              (iter (cdr things) answer))))
  (iter items '()))

(define (square x)
  (* x x))

(square-list (list 1 2 3 4))
