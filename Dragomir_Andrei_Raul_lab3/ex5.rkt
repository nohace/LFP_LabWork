#lang racket

(define (peval lst v)
  (define (loop coeffs acc)
    (if (null? coeffs)
        acc
        (loop (cdr coeffs) (+ (* acc v) (car coeffs)))))
  (loop (reverse lst) 0))
(displayln (peval '(1 2 3) 2))

