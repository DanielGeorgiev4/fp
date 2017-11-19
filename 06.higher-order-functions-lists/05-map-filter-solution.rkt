#lang racket
(require rackunit)
(require rackunit/text-ui)
(require "01-map-solution.rkt")
(require "02-filter-solution.rkt")
(require "03-fold-left-solution.rkt")
(require "04-fold-right-solution.rkt")

; Дефинирайте filter въз основа на fold-right
(define (filter p? xs)
  (fold-right (lambda (x y) (if(p? x) (cons x y) y)) '() xs)
)

; Дефинирайте map въз основа на fold-left
(define (map f xs)
  (fold-right (lambda (x y) (cons (f x) y)) '() xs)
)

(display "ACTUAL TESTS-----------------------------------------------------------\n")
(run-tests map-tests 'verbose)
(run-tests filter-tests 'verbose)