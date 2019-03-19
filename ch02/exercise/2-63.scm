(define (make-tree entry left right)
  (list entry left right))

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
                     (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

(define my-tree
  (make-tree 5
             (make-tree 3
                        (make-tree 1 '() '())
                        (make-tree 4 '() '()))
             (make-tree 6 '() '())))

(tree->list-1 my-tree)
(tree->list-2 my-tree)

;; b tree-list-1 时间复杂度为n^2, tree-list-2 时间复杂度为n
