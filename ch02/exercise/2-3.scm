(load "../exercise/2-2.scm")

;; ;; 起点和终点表示
;; (define (rectangle start-point end-point)
;;   (cons start-point end-point))

;; (define (start-point rect)
;;   (car rect))

;; (define (end-point rect)
;;   (cdr rect))

;; (define (width-of-rect rect)
;;   (abs (- (x-point (end-point rect))
;;           (x-point (start-point rect)))))

;; (define (height-of-rect rect)
;;   (abs (- (y-point (end-point rect))
;;           (y-point (start-point rect)))))

(define (perimeter rect)
  (* 2 (+ (width-of-rect rect)
          (height-of-rect rect))))

(define (area rect)
  (* (width-of-rect rect)
     (height-of-rect rect)))

;; 起点和宽高表示

(define (make-rectangle start-point width height)
  (cons start-point (cons width height)))

(define (width-of-rect rect)
  (car (cdr rect)))

(define (height-of-rect rect)
  (cdr (cdr rect)))
