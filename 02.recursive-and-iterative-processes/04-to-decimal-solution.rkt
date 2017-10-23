#lang racket
(require rackunit)
(require rackunit/text-ui)


; Обръщаме число от двоична в десетична бройна система
(define (to-decimal number)
  (define (helper n acc count)
    (if(= n 0)
       acc
       (helper (quotient n 10) (+ acc (* (remainder n 10) (expt 2 count)))
               (+ count 1))))
  (helper number 0 0)
)

(define tests
  (test-suite "to-decimal tests"
    (check-equal? (to-decimal 11001) 25)
    (check-equal? (to-decimal 1100011) 99)
  )
)

(run-tests tests 'verbose)