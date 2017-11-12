#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме функция, която приема списък и две числа и връща
; списък, състоящ се от елементите на списъка, които се намират на индекси от първото число до второто.

(define (slice xs start end)
  (if(= start 0)
     (if(or (null? xs) (> start end))
        '()
        (cons (car xs) (slice (cdr xs) start (- end 1))))
     (slice (cdr xs) (- start 1) (- end 1)))
)

(define tests
 (test-suite "Slice tests"
     (check-equal? (slice '(1 9 8 2) 1 2) '(9 8))
     (check-equal? (slice '(1 9 2 8 3) 2 10) '(2 8 3))
     (check-equal? (slice '(9 7 2 3) 0 2) '(9 7 2)) 
  )
)

(run-tests tests 'verbose)