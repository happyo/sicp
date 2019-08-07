;; 如果没有专门的或门，可以用与非门实现或门，方法是将两个输入接在一起的与非门作为另外一个与非门的两个输入，即可实现或门。

(define (nand-gate a1 a2 output)
  (let ((b (make-wire)))
    (and-gate a1 a2 b)
    (inverter b output)
    'ok))

(define (or-gate a1 a2 output)
  (let ((b1 (make-wire)) (b2 (make-wire)))
    (nand-gate a1 a1 b1)
    (nand-gate a2 a2 b2)
    (nand-gate b1 b2 output)
    'ok))

