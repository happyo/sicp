(load "2-69.scm")

(define msg-1 '(GET A JOB))

(define tree (generate-huffman-tree '((A 1) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1))))

(encode msg-1 tree)
