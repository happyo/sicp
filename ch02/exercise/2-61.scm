(define (adjoin-set x set)
  (cond ((null? set)
         (list x))
        (let ((current-element (car set))
              (remain-element (cdr set)))
          (cond ((= x current-element)
                 set)
                ((> x current-element)
                 (cons current-element
                       (adjoin-set x remain-element)))
                ((< x current-element)
                 (cons x set))))))


