#lang racket
(require rackunit)
(require rackunit/text-ui)

; Търсим процедура, която проверява дали дадено число завършва на дадено друго.

(define (ends-with? number test)
  (define (helper number test)
    (if(= test 0)
     #t
     (if(= (remainder number 10) (remainder test 10))
        (helper (quotient number 10) (quotient test 10))
        #f)))
  (if(= test 0)
     (if(= (remainder number 10) 0)
        #t
        #f)
     (helper number test))
)

(define tests
  (test-suite "ends-with? tests"
    (check-true (ends-with? 8317 17))
    (check-true (ends-with? 82 82))
    (check-false (ends-with? 8213 31))
    (check-true (ends-with? 210 0))
    (check-false (ends-with? 2921 2))
    (check-false (ends-with? 213 0))
  )
)

(run-tests tests 'verbose)