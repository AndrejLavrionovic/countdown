#lang racket

; Countdown 'numbers' game.
; Project in Theory of Algorithms 2017.
; Student: Andrej Lavrinovic (g00196984)

; I'll try to work with on easer problem first
; Assume that we have list of two numbers: [5, 25]

(define nums (list 5 25))

; Assume that total number is 125

(define totoal 125)

; List of operators

(define ops (list + * - /))

; functions we need to use

; sum
(define (sum l)
  (+ (car l) (cdr l)))

; multiplication
(define (mult l)
  (* (car l) (cdr l)))

; subtraction
(define (sub l)
  (- (car l) (cdr l)))

; devision
(define (dev l)
  (/ (car l) (cdr l)))

; revers
(define (revwcons-aux l a)
  (if (null? l)
      a
      (revwcons-aux (cdr l) (cons (car l) a))))

; Let say we are using brute-force algorithm
; then function will take list of two numbers,
; and list of operators
; but first we'll define the function for perform all operations

(define (calc_func oprs l res)
  (if (null? oprs) res
      (calc_func (cdr oprs) l (cons ((car oprs) (car l) (car (cdr l))) res))))

; This function takes as arguments:
; - list of operators eg.(+ * / -)
; - list of two numbers eg.(6 3)
; - empty list

(define l1 (list 6 3))

(calc_func ops l1 null)
; Result returned by calc_func: '(2 3 18 9)

