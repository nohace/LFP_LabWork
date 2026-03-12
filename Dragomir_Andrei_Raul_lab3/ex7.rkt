#lang racket
(define (rad a)
  (letrec ([good? (lambda (x)
                    (< (abs (- (* x x x) a)) 1e-10))]
           [next  (lambda (x)
                    (/ (+ (* 2.0 x) (/ a (* x x))) 3.0))]
           [it    (lambda (x)
                    (if (good? x) x (it (next x))))])
    (cond
      [(= a 0) 0.0]
      [else (it 1.0)])))

(displayln "ex.7")
(displayln (rad 8))
(displayln (rad 27))

