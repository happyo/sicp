(load "2-67.scm")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree)
         '())
        ((element-of-set? symbol (symbols (left-branch tree)))
         (cons '0 (encode-symbol symbol (left-branch tree))))
        ((element-of-set? symbol (symbols (right-branch tree)))
         (cons '1 (encode-symbol symbol (right-branch tree))))
        (else (error "Symbol is not in the tree" symbol))))

(define (element-of-set? x set)
  (if (memq x set)
      #t
      #f))

(encode (decode sample-message sample-tree) sample-tree)

