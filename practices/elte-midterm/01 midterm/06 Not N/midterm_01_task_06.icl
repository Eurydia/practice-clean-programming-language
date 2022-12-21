module midterm_01_task_06

import StdEnv

/*6. Not N

 Given a list of integers and an integer N, 
 eliminate from the list elements that are positioned before N in the list and are not equal to N,
 then compute the biquadrate of the numbers left in the list.
*/

//notN :: Int [Int] -> [Int]

Start = 1

//Start = notN 3 [1..5] // [1,16]
//Start = notN [] // []
//Start = notN 6 [10,8..1] // [10000,4096]