#lang racket


;; scrie doar yes/no la raspunsuri


(provide guess)

(define (guess)
  (define (loop lo hi k)
    (if (or (= lo hi) (= k 0))
        (begin
          (printf "n is ~a\n" lo)
          lo)
        (let ([v (quotient (+ lo hi) 2)])
          (printf "Is n greater than ~a? " v)
          (flush-output)
          (define ans (read))
          (if (equal? ans 'yes)
              (loop (+ v 1) hi (- k 1))
              (loop lo v (- k 1))))))
  (loop 1 4097 12))

(module+ main
  (guess))
