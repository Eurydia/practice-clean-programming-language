module midterm_01_task_09

import StdEnv

/*9. CoPrimes
 Given 2 numbers, check if they are co-prime.
 Numbers are called co-prime if they do not have
 common divisor.
*/

coPrimes :: Int Int -> Bool
coPrimes x y = (gcd x y) == 1

//Start = coPrimes 12 9 // False
//Start = coPrimes 12 12 // False
//Start = coPrimes 12 13 // True
Start = coPrimes 5 7 // True