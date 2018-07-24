(define (make-rat n d)
  (if (< 0 d)
      (cons (- n) (- d))
      (cons n d)))
