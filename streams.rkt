#lang racket

(require racket/list)

(define all-ones
  (letrec ([make-ones  (lambda () (cons 1 make-ones))]) (make-ones)))

(define (nats-from n) 
  (cons n (lambda () (nats-from (+ n 1)))))

(define (s-take n s)
  (cond [(= n 0) null] ; base case
        [(procedure? s) (s-take n (s))] ; unfold s, to get a visible prefix
        [else (cons (car s) (s-take (- n 1) (cdr s)))]))

(define (s-filter p s)
  (cond [(procedure? s) (s-filter p (s))]
        [(p (car s)) (cons (car s) (lambda () (s-filter p (cdr s))))]
        [else (s-filter p (cdr s))]))

(define (s-map f s)
  (cond [(procedure? s) (s-map f (s))]
        [else (cons (f (car s)) (lambda () (s-map f (cdr s))))]))

(define s3-v1 (s-map (lambda (n) (* 3 n)) (nats-from 0)))
(define s3-v2 (s-filter (lambda (n) (= (remainder n 3) 0)) (nats-from 0)))
(s-take 5 s3-v1)
(s-take 5 s3-v2)
(define nats (nats-from 0))

(define (s-add s1 s2)
  (cond [(procedure? s1) (s-add (s1) s2)]
        [(procedure? s2) (s-add s1 (s2))]
        [else (cons (+ (car s1) (car s2))
                    (lambda () (s-add (cdr s1) (cdr s2))))]))

(define (s-drop n s)
  (cond [(= n 0) s]
        [(procedure? s) (s-drop n (s))]
        [else (s-drop (- n 1) (cdr s))]))

(define s2 (s-drop 3 (s-add nats nats)))

(define fib (cons 1 (cons 1 (lambda () (s-add fib (cdr fib))))))












; ex1
(define (s-ref m s)
  (if (procedure? s)
      (s-ref m (s))
      (if (= m 0)
          (car s)
          (s-ref (- m 1) (cdr s)))))

(define (s-range m n s)
  (if (procedure? s)
      (s-range m n (s))
      (if (> m 0)
          (s-range (- m 1) (- n 1) (cdr s))
          (if (= n 0)
              (list (car s))
              (cons (car s) (s-range 0 (- n 1) (cdr s)))))))












; ex2
(define as
  (cons 1
        (cons 2
              (lambda ()
                (s-add
                 (s-map (lambda (x) (* 2 x)) (cdr as))
                 (s-map (lambda (x) (* -3 x)) as))))))







; ex3
(define (sieve s)
  (if (procedure? s)
      (sieve (s))
      (cons (car s)
            (lambda ()
              (sieve
               (s-filter (lambda (x) (not (= (remainder x (car s)) 0)))
                         (cdr s)))))))

(define primes (sieve (nats-from 2)))
(define all-primes primes)










; ex4
(define (s-merge s1 s2)
  (if (procedure? s1)
      (s-merge (s1) s2)
      (if (procedure? s2)
          (s-merge s1 (s2))
          (if (< (car s1) (car s2))
              (cons (car s1) (lambda () (s-merge (cdr s1) s2)))
              (if (> (car s1) (car s2))
                  (cons (car s2) (lambda () (s-merge s1 (cdr s2))))
                  (cons (car s1) (lambda () (s-merge (cdr s1) (cdr s2)))))))))

(define (sum-stream s1 s2)
  (if (procedure? s1)
      (sum-stream (s1) s2)
      (if (procedure? s2)
          (sum-stream s1 (s2))
          (cons (+ (car s1) (car s2))
                (lambda ()
                  (s-merge
                   (s-map (lambda (x) (+ (car s1) x)) (cdr s2))
                   (sum-stream (cdr s1) s2)))))))














; ex5
(define ham
  (cons 1
        (lambda ()
          (s-merge
           (s-map (lambda (x) (* 2 x)) ham)
           (s-merge
            (s-map (lambda (x) (* 3 x)) ham)
            (s-map (lambda (x) (* 5 x)) ham))))))

(define (ham-between m n)
  (define (countit s)
    (if (procedure? s)
        (countit (s))
        (if (> (car s) n)
            0
            (if (< (car s) m)
                (countit (cdr s))
                (+ 1 (countit (cdr s)))))))
  (countit ham))









; ex6
(define (pairsFor n)
  (define (loop a)
    (if (> a n)
        null
        (cons (cons a (- n a)) (loop (+ a 1)))))
  (loop 0))

(define (pairsFrom n)
  (append (pairsFor n)
          (lambda () (pairsFrom (+ n 1)))))

(define natPairs (pairsFrom 0))





; ex7
(define (prod-stream a b)
  (if (procedure? a)
      (prod-stream (a) b)
      (if (procedure? b)
          (prod-stream a (b))
          (cons (* (car a) (car b))
                (lambda ()
                  (s-add
                   (s-map (lambda (x) (* (car a) x)) (cdr b))
                   (prod-stream (cdr a) b)))))))

; test
(s-take 20 (s-merge
            (s-map (lambda (x) (* 5 x)) nats)
            (s-map (lambda (x) (* 7 x)) nats)))

(define squares (s-map (lambda (x) (* x x)) (nats-from 1)))
(s-take 12 (sum-stream squares squares))

(s-take 20 ham)
(ham-between 20 44)

(s-take 10 (prod-stream all-primes all-primes))
(s-take 10 (prod-stream fib fib))
(s-take 10 (prod-stream all-primes fib))
