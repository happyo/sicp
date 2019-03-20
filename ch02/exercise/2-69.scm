(load "../example/HuffmanTree.scm")


(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (cond ((null? leaf-set)
         '())
        ((= 1 (length leaf-set))
         (car leaf-set))
        (else (let ((merged-leaf (merge-tree (car leaf-set)
                                             (cadr leaf-set))))
                (successive-merge (adjoin-set merged-leaf
                                          (cddr leaf-set)))))))

(define (merge-tree tree1 tree2)
  (let ((weight1 (weight tree1))
        (weight2 (weight tree2)))
    (if (> weight1 weight2)
        (make-code-tree tree2
                        tree1)
        (make-code-tree tree1
                        tree2))))

(define haha-set (make-leaf-set (list (list 'A 4) (list 'B 2) (list 'C 1) (list 'D 1))))

(generate-huffman-tree (list (list 'A 4) (list 'B 2) (list 'C 1) (list 'D 1)))
