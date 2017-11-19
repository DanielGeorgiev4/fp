#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да групираме последователни еднакви елементи на списък в подсписъци.
; Както в теста.
 (define (similar-to m xs acc)
   (if(or (null? xs) (not (= (car xs) m)))
      acc
      (similar-to m (cdr xs) (+ acc 1)))
 )
(define (group xs)
  (if(null? xs)
     '()
     (cons (take xs (similar-to (car xs) xs 0)) (group (drop xs (similar-to (car xs) xs 0))))
  )
)

(define tests
  (test-suite "Group tests"
    (check-equal? (group '(1 1 1 2 2 3 1 1 1 2 2 2 2 2 3 3 3 3)) '((1 1 1) (2 2) (3) (1 1 1) (2 2 2 2 2) (3 3 3 3)))
  )
)

(run-tests tests 'verbose)