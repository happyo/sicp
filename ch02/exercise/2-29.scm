(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; b
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (if (mobile? (branch-structure branch))
      (+ (branch-weight (left-branch (branch-structure branch)))
         (branch-weight (right-branch (branch-structure branch))))
      (branch-structure branch)))

(define (mobile? x)
  (pair? x))

;; c
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (mobile-balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and
     (branch-balance? left)
     (branch-balance? right)
     (same-torque? left right))))

(define (same-torque? left right)
  (= (branch-torque left)
     (branch-torque right)))

(define (branch-balance? branch)
  (if ((pair? (branch-structure branch)))
      (mobile-balance? (branch-structure branch))))

;; d
(define (make-mobile left right) (cons left right))
(define (make-branch length structure)
  (cons length structure))

(define (right-branch branch)
  (cdr branch))

(define (branch-structure branch)
  (cdr branch))
