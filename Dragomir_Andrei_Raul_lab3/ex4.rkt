#lang racket



;; (a)

(define (f n)
  (cond
    [(= n 0) 1]
    [(= n 1) 2]
    [else
     (define (loop i f0 f1)
       (if (> i n)
           f1
           (loop (+ i 1)
                 f1
                 (- (* 2 f1) (* 3 f0)))))
     (loop 2 1 2)]))

;; (b)

(define (g n)
  (cond
    [(= n 0) 1]
    [(= n 1) 2]
    [else
     (define (loop i g0 g1)
       (if (> i n)
           g1
           (loop (+ i 1)
                 g1
                 (- (* 2 i g1) (* 3 g0)))))
     (loop 2 1 2)]))

;; (c) EVEN ODD

(define (h n)
  (cond
    [(= n 0) 1]
    [(= n 1) 1]
    [(= n 2) 2]
    [else
     (define (loop i h-im3 h-im2 h-im1)
       (if (> i n)
           h-im1
           (let ([hi (if (even? i)
                         (+ h-im1 h-im2)
                         (+ (* 2 h-im1) (* 3 h-im3)))])
             (loop (+ i 1) h-im2 h-im1 hi))))
     (loop 3 1 1 2)]))

(displayln "ex.4")
(displayln "f:")
(displayln (f 0))
(displayln (f 1))
(displayln (f 2))
(displayln (f 3))
(displayln (f 4))


(displayln " ")

(displayln "g:")
(displayln (g 0))
(displayln (g 1))
(displayln (g 2))
(displayln (g 3))
(displayln (g 4))



(displayln " ")
(displayln "h:")
(displayln (h 0))
(displayln (h 1))
(displayln (h 2))
(displayln (h 3))
(displayln (h 4))
(displayln (h 5))
(displayln (h 6))
