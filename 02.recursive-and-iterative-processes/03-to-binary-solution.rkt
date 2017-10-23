#lang racket
(require rackunit)
(require rackunit/text-ui)

; Обръщаме число в двоична бройна система

(define (to-binary number)
  (define (helper n acc count)
    (if(= n 0)
       acc
       (helper (quotient n 2) (+ acc (* (remainder n 2) (expt 10 count)))
               (+ count 1))))
  (helper number 0 0)
)

(define tests
  (test-suite "to-binary tests"
    (check-equal? (to-binary 10) 1010)
    (check-equal? (to-binary 0) 0)
    (check-equal? (to-binary 8) 1000)
  )
)

(run-tests tests 'verbose)