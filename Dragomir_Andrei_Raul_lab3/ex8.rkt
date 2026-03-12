#lang racket
(define (foo a b)
  (let ([r (remainder a 2)])
    (cond
      [(= a 1) b]
      [(= r 0) (foo (/ a 2) (* b 2))]
      [else (+ (foo (/ (- a 1) 2) (* b 2)) b)])))


;; a) is not tail-recursive, if numebr is odd we still have stuff to do after recursive is called
;; b) foo(a,b) computes a*b.


(define (bar a b)
  (define (loop a b acc)
    (let ([r (remainder a 2)])
      (cond
        [(= a 1) (+ acc b)]
        [(= r 0) (loop (/ a 2) (* b 2) acc)]
        [else (loop (/ (- a 1) 2) (* b 2) (+ acc b))])))
  (loop a b 0))



(displayln (foo 13 7))
(displayln (bar 13 7))

