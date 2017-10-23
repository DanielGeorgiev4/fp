#lang racket
(require rackunit)
(require rackunit/text-ui)
; 1.7 - Търсим процедура, която проверява дали едно число е палиндром.
; Трябва да работи и за отрицателни числа.

(define (palindrome? number)
  (define (reverse-digits number)
    (define (helper number acc)
      (if(= number 0)
         acc
         (helper (quotient number 10) (+ (* acc 10) (remainder number 10)))))
    (helper number 0))
  (if(= number (reverse-digits number))
     #t
     #f)
)

(define tests (test-suite
  "Palindrome tests"

  (test-case "Should function correctly"
    (check-true (palindrome? 12321))
    (check-false (palindrome? 872))
    (check-true (palindrome? 2))
    (check-true (palindrome? 310013))
    (check-true (palindrome? -21212))
)))

(run-tests tests 'verbose)