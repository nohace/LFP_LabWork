#lang racket


;; a
(define (tr-length lst)
  (define (loop lst acc)
    (if (null? lst)
        acc
        (loop (cdr lst) (+ acc 1))))
  (loop lst 0))

;; b
(define (tr-min lst)
  (define (loop lst acc)
    (if (null? lst)
        acc
        (loop (cdr lst)
              (if (< (car lst) acc) (car lst) acc))))
  (loop (cdr lst) (car lst)))

(displayln "ex.2")
(displayln (tr-length '(10 20 30 40 50)))  
(displayln (tr-min '(7 3 9 -2 5 11)))      
