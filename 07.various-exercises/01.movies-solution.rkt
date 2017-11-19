#lang racket

(define movies '(
  ("Fight Club" 8.8 1999)
  ("Requiem for a Dream" 8.3 2000)
  ("The Ladykillers" 6.2 2004)
  ("Juno" 7.5 2007)
  ("Watchmen" 7.6 2009)
  ("Scott Pilgrim vs. the World" 7.5 2010)
  ("Tangled" 7.8 2010)
  ("Moonrise Kingdom" 7.8 2012)
  ("The Perks of Being a Wallflower" 8.0 2012)
  ("Hotel Transylvania" 7.1 2012)
  ("The Spectacular Now" 7.1 2013)
  ("Rush" 8.1 2013)
  ("A Long Way Down" 6.4 2014)
  ("Guardians of the Galaxy" 8.1 2014)
  ("A Man Called Ove" 7.7 2015)
))
(define rating8 (filter (lambda (x) (>= (cadr x) 8)) movies))
; Искаме заглавията на всички филми, с рейтинг >= 8
(define first (map (lambda (x) (car x)) rating8))

; Искаме годината на излизане на най-новия филм с рейтинг >= 8
(define (helper newest xs)
  (cond
    ((null? xs) newest)
    ((> (caddar xs) newest) (helper (caddar xs) (cdr xs)))
    (else (helper newest (cdr xs)))
  )
)
(define second (helper (caddar rating8) rating8))

; Искаме рейтингите на всички филми, които имат "u" в името си.
; (string-contains? str search) ни казва дали str съдържа search (и двата аргумента са низове).
(define third (map (lambda (x) (cadr x)) (filter (lambda (x) (string-contains? (car x) "u")) movies)))

; Искаме годината на излизане на филма с най-дълго заглавие
(define (longest-title xs acc)
  (cond
    ((null? xs) acc)
    ((> (string-length (caar xs)) (string-length acc)) (longest-title (cdr xs) (caar xs)))
    (else (longest-title (cdr xs) acc))
  )
)
(define fourth (longest-title movies (caar movies)))