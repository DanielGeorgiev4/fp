#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да проверим дали число е просто.

(define (prime? number)
  (define (helper number count)
    (if(> count (sqrt number))
       #t
       (if(= (remainder number count) 0)
          #f
          (helper number (+ count 1)))))
  (if(= number 1)
     #f
     (helper number 2))
)

(define tests
  (test-suite "prime? tests"
    (check-false (prime? 1))
    (check-true (prime? 5))
    (check-false (prime? 1729))
    (check-false (prime? 41041))
  )
)

(run-tests tests 'verbose)