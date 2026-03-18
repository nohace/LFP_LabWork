#lang racket



(provide shell-sort)

(define (shell-sort v)
  (define n (vector-length v))
  (define gap (quotient n 2))
  (while (> gap 0)
    (define i gap)
    (while (< i n)

      (define temp (vector-ref v i))
      (define j i)
      (while (and (>= j gap) (> (vector-ref v (- j gap)) temp))
        (vector-set! v j (vector-ref v (- j gap)))
        (set! j (- j gap)))
      (vector-set! v j temp)
      (set! i (+ i 1)))
    (set! gap (quotient gap 2)))
  (void))


(define-syntax-rule (while test body ...)
  (let loop ()
    (when test
      body ...
      (loop))))

(module+ main
  (define v (list->vector '(7 1 6 4 12)))
  (shell-sort v)
  (displayln v))
