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
  (+ (car l) (car (cdr l))))

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

; output with solution:
'(solution with two numbers)
(define opssymb (list '+ '* '/ '-))
(define ops1 (list + * / -))

(define (calc_func1 oprs oprssymb l res)
  (if (null? oprs) res
      (calc_func1 (cdr oprs) (cdr oprssymb) l (cons
                               (list (car l) (car oprssymb) (car (cdr l)) '=
                                     ((car oprs) (car l) (car (cdr l))))
                                res))))

(calc_func1 ops1 opssymb l1 null)
'(====================================)

; Here is the function that checks is the permutation is valid
; where e is expression such as (1 1 1 1 1 1 -1 -1 -1 -1 -1)
; and s is stack

; 1) stack functions
(define (poll-last st) (car (reverse st)))
(define (add-last st x) (append st (list x)))
(define (all-but-last st) (reverse (cdr (reverse st))))

; 2) Function it self
(define (valid-rpn? e stack)
  (if (null? e) #t
      (cond
        [(= (car e) 1) (valid-rpn? (cdr e) (add-last stack 1))]
        [else
         (if (> (length stack) 1)
             (if (and (= (car (reverse stack)) 1)
                       (= (car (cdr (reverse stack))) 1))
                  (valid-rpn? (cdr e)
                              (add-last (all-but-last (all-but-last stack)) 1))
                  #f)
             #f)])))

; Test of function is here:
(define valid-permutation '(1 1 1 -1 1 -1 -1 1 -1 1 -1))
(define not-valid-permutation '(1 1 1 -1 1 -1 -1 -1 1 1 -1))

(valid-rpn? valid-permutation '())
(valid-rpn? not-valid-permutation '())

'(====================================)
; functions generating combinatons of numbers and permutations

; function that implements values for rpn patterns
; considering that pattern is allways starts from
; (1 1) and ends with (-1), the function genirates just
; middle part of pattern.
(define (opers-ops-nums num res)
  (if (= num 0) res
      (opers-ops-nums (- num 1) (append (list -1 1) res))))


; assume there is combination of 4 numbers
; 1s -representing operands
; -1s -representing operators, then
; pattern must contain 4 numbers and 3 operators - (1 1 1 1 -1 -1 -1)
; with default (1 1) and (-1) we need to generate 2 more of both
; numbers and operators, thus call this function with parameter 2 and
; empty list. It returns (-1 1 -1 1).
; pattern order is not important as it will be shuffled with
; permutation function.
(opers-ops-nums 2 '())

(define (comb l)
  (opers-ops-nums l '()))
(define start-perm (comb 4))

; creates all available permutations with given pattern
(define pattern-permutations(remove-duplicates (permutations start-perm)))

; this function is concatinating the generated middle part with
; start list (1 1) and end list (-1)
(define (make-rpn l)
  (append (list 1 1) l (list -1)))

; map is very important function in racket
; it glue elements together
; it takes each available pattern and concatinates the
; (list 1 1) on the start
; and (list -1) on the end
 (map make-rpn pattern-permutations)

'(=====================================)
; Next step is to generate combinations of numbers

; Two following functions are generating the all available permutations
; of the given number.
(define X (combinations nums))

(map permutations X)

'(======================================)