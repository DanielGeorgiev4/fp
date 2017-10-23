#lang racket
(require rackunit)
(require rackunit/text-ui)
(define (squares-sum-bigger-two a b c)
  (define (square_two x y) (+ (* x x) (* y y)))
  (cond
    ((or (< a b) (< a c)) (square_two b c)) 
    ((or (< b a) (< b c)) (square_two a c))
    ((or (< c a) (< c b)) (square_two a b))
    (else (square_two b c))
    )
)