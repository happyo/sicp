(load "../Example/Stream.scm")

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define facts (cons-stream 1 (mul-streams facts integers)))
