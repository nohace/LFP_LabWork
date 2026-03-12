#lang racket



(define (tr-flatten lst)
  (define (loop todo acc)
    (cond
      [(null? todo) (reverse acc)]
      [(integer? (car todo))
       (loop (cdr todo) (cons (car todo) acc))]
      [else
       (loop (append (car todo) (cdr todo)) acc)]))
  (loop lst '()))

(displayln "Ex.3")
(displayln (tr-flatten '((1) (() (2 3)) (4))))
(displayln (tr-flatten '((1 (2)) ((3)) 4)))    
