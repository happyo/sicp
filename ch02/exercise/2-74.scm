;; a
(define (attach-tag type-tag contents) (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum: TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum) (cdr datum)
      (error "Bad tagged datum: CONTENTS" datum)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error
           "No method for these types -- APPLY-GENERIC"
           (list op type-tags))))))

(define (get-record name file)
  (apply-generic 'get-record name file))

(define (install-branch-one-package)
  (define (get-record name file)
    (filter (lambda (record) (eq? name (car record)))
            file))
  (define make-record
    (attach-tag
     'branch-one
     (list (list 'Tom 'Canada 100)
           (list 'Susan 'Italy 200))))
  (put 'get-record '(branch-one) get-record)
  (put 'make-record '(branch-one) make-record)
  'done)

(define (install-branch-two-package)
  (define (record-name record)
    (caddr record))
  (define (get-record name file)
    (filter (lambda (record) (eq? name (record-name record)))
            file))
  (define make-record
    (attach-tag
     'branch-two
     (list (list 100 'Tom 'Espana)
           (list 200 'Susan 'France))))
  (put 'get-record '(branch-two) get-record)
  (put 'make-record '(branch-two) make-record)
  'done)

(define branch-one-record
  (apply-generic 'make-record '(branch-one)))
(define branc-two-record
  (apply-generic 'make-record '(branch-two)))

(apply-generic 'get-record 'Tom branch-one-record)
