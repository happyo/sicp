(load "2-40.scm")
(define (find-triples n s)
  (filter (right-triple s)
          (triples n)))

(define (triples n)
  (flatmap (lambda (x)
             (map (lambda (y)
                    (cons x y))
                  (unique-pairs (- i 1))))
           (enumerate-interval 1 n)))

(define (right-triple sum triple)
  (= sum
     (fold-right + 0 triple)))
