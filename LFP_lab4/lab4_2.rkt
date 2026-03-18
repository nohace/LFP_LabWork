#lang racket

(require racket/format)

(provide matrixShow)

(define (matrixShow A)
  (display "(")
  (newline)
  (define first-row? #t)
  (for-each
   (lambda (row)
     (if first-row?
         (set! first-row? #f)
         (begin (display " ") (newline)))
     (display "(")
     (for-each (lambda (x) (display (~a x #:width 4 #:align 'right))) row)
     (display ")"))
   A)
  (newline)
  (display ")")
  (newline)
  (void))

(module+ main
  (matrixShow '((12 -25 0 7) (-18 3 25 0))))
