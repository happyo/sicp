(load "2-36.scm")
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))

;; (dot-product (list 1 2 3) (list 1 2 3))

;; (matrix-*-vector (list (list 1 2 3) (list 4 5 6)) (list 1 2 3))

(define (transpose mat)
  (accumulate-n cons '() mat))

;; (transpose (list (list 1 2 3) (list 4 5 6)))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

;; (matrix-*-matrix (list (list 1 2 3) (list 4 5 6))
                 ;; (list (list 1 4) (list 2 5) (list 3 6)))

