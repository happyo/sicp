(load "../example/square.scm")
(define (f g)
  (g 2))

(f square)

;; (f f)
;; (f (lambda (g) (g 2)))
;; ((lambda (g) (g 2))
;;  (lambda (g) (g 2)))
;; ((lambda (g) (g 2)) 2)
;; (2 2)
;; 2 不是一个函数
