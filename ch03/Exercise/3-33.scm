(load "../Example/Constraint.scm")

(define (average a b c)
  (let ((u (make-connector))
        (v (make-connector)))
    (adder a b u)
    (multiplier v c u)
    (constant 2 v)
    'ok))
