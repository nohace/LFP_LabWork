#lang racket


(provide bsort)

(define (bsort v)
  (define n (vector-length v))
  (define i 0)
  (while (< i (- n 1))
    (define j 0)
    (while (< j (- n i 1))
      (when (> (vector-ref v j) (vector-ref v (+ j 1)))
        (define tmp (vector-ref v j))
        (vector-set! v j (vector-ref v (+ j 1)))
        (vector-set! v (+ j 1) tmp))
      (set! j (+ j 1)))
    (set! i (+ i 1)))
  (void))


(define-syntax-rule (while test body ...)
  (let loop ()
    (when test
      body ...
      (loop))))

(module+ main
  (define v (list->vector '(7 1 6 4 12)))
  (bsort v)
  (displayln v))
