# Countdown numbers game.
##### Project in Theory of Algorithms 2017
##### Galway-Mayo Institute of Technology Department of Computer Science and Applied Physics.

### Overview

Countdown is a game show. It is still shown today and is one of the longest running game shows in the world.

The concept of the show is based on game showed earler in the France called: 'Des chiffres et des lettres' (Numbers and Letters). From the 'letters' round the contestants should create the longest word from the randomly selected letters. In the 'numbers' round players should to combine six randomly picked numbers (using four general operations +, -, \*, and /) to get as close as posible to randomly generated total which is number between 101 and 999.

*Information taken from [Countdown Game Show](http://datagenetics.com/blog/august32014/index.html).*

### Game Rules
* Player is given 6 numbers that are randomly picked from number set;
* Number set consists from 20 small numbers and 4 large numbers;
* Small numbers are {1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10}
* Large numbers are {25,50,75,100}
* Complete set is {1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,25,50,75,100}
* The three-digit target number is generating wich is between 101 and 999 inclusive;
* Using 6 given numbers and four basic operations {+,-,*,/}, the player need to calculate target number;
* Player doesn't need to use all 6 numbers;
* Each of the given 6 nubmers can only be used once;
* If the same number appears twice in the list of six then it cna be used twice;
* Concantination of the digit is not allowed;
* At each intermediate stage of the calulation, negative numbers and fractions are not allowed;

##### Example:
>424 - is a target number;

>[100,25,10,2,2,1] -  is a 6 randomly picked numbers;

>Solution is: (100 \* (2 + 2)) + 25 \- 1 = 424;
 
### What does need to run
* drracket - download [here](https://download.racket-lang.org/)
* countdown.rkt script

### How to run
1) Clone repository from the https://github.com/AndrejLavrionovic/countdown
```bash
$ git clone https://github.com/AndrejLavrionovic/countdown
```
2) Start drracket

3) File -> Open -> .../countdown/countdown.rkt

4) Press run button on the right top corner of drracket editor.

### Solution for Countdown numbers game
One of the algorithm that can be used to figure out the solution is Brute-force search.
It is a very general technique of sloving problems. This method assumes to check all possible candidates
and pick those who satisfies the solution for the problem.

Adopted from [Wikipedia](https://en.wikipedia.org/wiki/Brute-force_search)

Tip (by Ian Mcloughlin): Try to work on easer broblem first rather then to work on complicated problem.
Instead of work with list of six numbers, try to use list of two numbers first and see how it is work.

The function that I defined returns four solution with no repeating, that is count only 2 + 4 and skips 4 + 2.

```racket
(define (calc_func1 oprs oprssymb l res)
  (if (null? oprs) res
      (calc_func1 (cdr oprs) (cdr oprssymb) l (cons
                               (list (car l) (car oprssymb) (car (cdr l)) '=
                                     ((car oprs) (car l) (car (cdr l))))
                                res))))
```
 and result is:
 ```racket
 '((6 - 3 = 3)
  (6 / 3 = 2)
  (6 * 3 = 18)
  (6 + 3 = 9))
 ```

As we can see from example above in line 3 there is recursive function that calls it self. Using this ability we can change some state of function's properties. Also there should be the way to stop recursion or it will iterate infinitely. In code snipet from above there is condition that tells \- if list 'oprs' is not null (empty) do recursion or return list 'res' in other case. List 'oprs' contains four basic operators: {+, \*, /, \-} , so 'calc_func1' iterates 4 times. In every next recursion (cdr oprs) is passed as the parameter, that is list without first element. So if to take appart this part of code, we'll see that in first iteration list of {\*, /, \-} is passing to the function (cdr oprs). In second recursion - {/, \-} => (cdr (cdr oprs)), in thired \- {\-} => (cdr (cdr (cdr oprs))), end {} \- empty list will be passed on the end as (cdr (cdr (cdr (cdr oprs)))) will give as empty list. At the same time in every iteration the first element from the 'oprs' list is used for evaluation of maths expressions, that is:

* \+ => (car oprs)
* \* => (car (cdr oprs))
* / => (car (cdr (cdr oprs)))
* \- => (car (cdr (cdr (cdr oprs))))

To print all solutions function takes another list of operator's literals 
```racket
(define opssymb (list '+ '* '/ '-))
...
(list (car l) (car oprssymb) (car (cdr l)) '=
      ((car oprs) (car l) (car (cdr l))))
```

### Steps for implementation the solution

To solve the countdown problem, it should be broken down on the smaller steps. Each stem should solve the particular part of the problem that is can be considered as the component of the solution. Thus, it is very important to be clear what components the solution consist from.

Initially there is given goal number, set of numbers and default set of operators. To get the goal number we need to calculate all possible combinations of number set. This can be the first step - get all possibles permutations of numbers.

To figure out the second step there is Reverse Polish Notation technique can be considered. The feature of RPN is that calculation performs using tree concept where the root is last operator and leaves are operands. Another thing is that operator is always goes last, after two operands. It means that calculation process from the leaves, but not from root. So, the expression (3 + 5) \* (7 – 2) in RPN conversion will be written in this format: 3 5 + 7 2 – \*. To perform this calculation, we need to use the stack concept. Start reading from left to right and if there is operand, putting it into stack, but if there is operator, then pulling two operands out, performing the calculation and putting the result back to the stack. The last number in the stack will be result. So:

1.	Push 3 onto the stack.
2.	Push 5 onto the stack. Reading from the bottom, the stack now contains (3, 5).
3.	Apply the + operation: take the top two numbers off the stack, add them together, and put the result back on the stack. The stack now contains just the number 8.
4.	Push 7 onto the stack.
5.	Push 2 onto the stack. It now contains (8, 7, 2).
6.	Apply the – operation: take the top two numbers off the stack, subtract the top one from the one below, and put the result back on the stack. The stack now contains (8, 5).
7.	Apply the * operation: take the top two numbers off the stack, multiply them together, and put the result back on the stack. The stack now contains just the number 40.

After the taking apart the reverse polish notation technique, there are some rules can be emphasised, such as if operator is in turn, then stack must contain at least two numbers. Based on this fact we can figure out that next component of the solution can be pattern of calculation. If to represent numbers as 1s and operators as -1s, then pattern can be looked like this: 
(1 1 1 -1 1 -1 -1 1 -1 1 -1).

As positive 1 will be replaced with numbers and there is set of all possible permutations, then next problem is to replace all negative 1s with operators. So, third component must be all possible combination if operators. It is hard task to evaluate with using recursive way.

The las two steps is to perform evaluation where firstly - each 1 in the each valid pattern need to be replaced with number from each permutation and each -1 need to be replaced with each operator from each combination of operators. And second and final step is to evaluate each solution using rpn technique where the last number in the stack must be result and compare each result with given goal number. If there will be equality, then It’ll be solution.

### Difficultuies in the project.

* I didn't find the way how to generate the all available combination of operators using recursion.

* it was not easy to understand the way how is Racket language arranged. Still not very much clear, but I thing it is very strong and efficient aproach to evaluate different problems by implementing techinques and algorithms using Racket.

