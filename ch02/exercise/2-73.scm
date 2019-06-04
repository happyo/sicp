(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum (make-product
                    (multiplier exp)
                    (deriv (multiplicand exp) var))
                   (make-product
                    (deriv (multiplier exp) var)
                    (multiplicand exp))))
        <more rules can be added here>
        (else (error "Unknown expression type: DERIV" exp))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) car))))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))


;; a
;; number? 和 variable? 没有通用的操作

;; b
(define (install-sum-package)
  (define (addend s)
    (car s))

  (define (augend s)
    (cadr s))

  (define (make-sum x y)
    (cond ((=number? x 0)
           y)
          ((=number? y 0)
           x)
          ((and (number? x) (number? y))
           (+ x y))
          (else
           (attach-tag '+ x y))))

  (put 'addend '+ addend)
  (put 'augend '+ augend)
  (put 'make-sum '+ make-sum)

  (put 'deriv '+
       (lambda (exp var)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var))))
  'done)

(define (make-sum x y)
  ((get 'make-sum '+) x y))

(define (addend sum)
  ((get 'addend '+) (contents sum)))

(define (augend sum)
  ((get 'augend '+) (contents sum)))


