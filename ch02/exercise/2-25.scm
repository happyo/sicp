(define A (list 1 3 (list 5 7) 9))
(define B (list (list 7)))
(define C (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 (list 7))))))))

(car (cdr (car (cdr (cdr A)))))
(car (car B))
(car (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr C)))))))))))))
