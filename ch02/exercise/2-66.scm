(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        (else (let ((x (entry set-of-records)))
                (cond ((= given-key (key x))
                       x)
                      ((< given-key (key x))
                       (lookup given-key (left-branch set-of-records)))
                      ((> given-key (key x))
                       (lookup given-key (right-branch set-of-recorde))))))))

