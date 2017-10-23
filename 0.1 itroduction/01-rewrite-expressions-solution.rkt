#lang racket
(require rackunit)
(require rackunit/text-ui)
(define a (+
           (/
            (+
             2
             (/ 3 16))
            (* 9 2.78))
           (-
            (/ 5 2)
            6)))
(define b (/
           (+
            15
            21
            (/ 3 15)
            (- 7 (* 2 2)))
           16))
(define c (/
           (+
            5
            (/ 1 4)
            (- 2 (- 3 (+ 6 (/ 1 5)))))
           (*
            3
            (- 6 2)
            (- 2 7))))
(define (square x) (* x x))
(define d (/
           (+ (square 3) 5)
           (- (* 3 3 3) 2)))
(define e (+
           (square (square 16))
           (/ 95 2)))
(define first-tests
  (test-suite
    "Translated expressions tests"

    (test-case "1.1-a"

      (check-equal? a -3.412569944044764))

    (test-case "1.1-b"
      (check-equal? b 49/20))

    (test-case "1.1-c"
      (check-equal? c -209/1200))

    (test-case "1.1-d"
      (check-equal? d 14/25))

    (test-case "1.1-e"
      (check-equal? e 131167/2))))
(run-tests first-tests 'verbose)