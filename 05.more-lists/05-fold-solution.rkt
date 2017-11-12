#lang racket
(require rackunit)
(require rackunit/text-ui)

; Като accumulate, но със списък, вместо с интервал.

(define (fold op null-value xs)
  (if(null? xs)
     null-value
     (op (car xs) (fold op null-value (cdr xs))))
)

(define tests
  (test-suite "Fold tests"
     (check-equal? (fold + 0 (list 1 2 3 4 90)) 100)
     (check-equal? (fold * 1 (list 2 7 3)) 42)
  )
)

(run-tests tests 'verbose)