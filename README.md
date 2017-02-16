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


