module midterm_02_task_07

import StdEnv 


/* 7. Collatz conjecture

 Given a positive number greater than 1, return how many iterations does it 
 take for that number to fall down to "2" if we keep applying the
 Collatz equation on it.
 Collatz conjecture equation:
 If the number is even -> x/2
 If the number is odd -> 3x+1
 e.g: input: 10 
      steps: 10 -> 5 -> 16 -> 4 -> 2
      output: 4 recursive calls
*/

doCollatz :: Int Int -> Int
doCollatz num step
| num == 2 = step
| isOdd num = doCollatz ((num * 3) + 1) (step + 1)
| isEven num = doCollatz (num / 2) (step + 1)


collatz :: Int -> Int
collatz n = doCollatz n 0
	
//Start = collatz 10 // 4
//Start = collatz 20000000 // 144
Start = collatz 5 // 3
//Start = collatz 0 // "The number must be greater than 1"

