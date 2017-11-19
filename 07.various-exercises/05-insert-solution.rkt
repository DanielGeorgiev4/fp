#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да вмъкнем х в списъка хs на съответния index.
; Индексираме от 0.

(define (insert x index xs)
  (if(null? xs)
     (if(> index 0)
        (cons x '())
        '()
     )
     (if(= index 0)
        (cons x (insert x (- index 1) xs))
        (cons (car xs) (insert x (- index 1) (cdr xs)))
     )
  )
)

(define tests
 (test-suite "random-tests"
   (check-equal? (insert 2 1 '(1 3 4 5)) '(1 2 3 4 5))
   (check-equal? (insert 8 0 '(1 7 5)) '(8 1 7 5))
   (check-equal? (insert 99 3 '()) '(99))
   (check-equal? (insert 99 88 '(1 2 3)) '(1 2 3 99))
 )
) 

(run-tests tests 'verbose)