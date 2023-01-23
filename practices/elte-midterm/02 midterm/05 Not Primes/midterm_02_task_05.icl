module midterm_02_task_05

import StdEnv 

/* 5. Not Primes
 Given a list of integers, write a function which removes the prime numbers   from the list.
 There will be no negative integers and consider the number 1 not a prime.
*/

isPrime :: Int -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n = all (\(k) = not (n rem k == 0)) [2..(n - 1)]

removeNotPrime :: [Int] -> [Int]
removeNotPrime ns =  filter (\(n) = not (isPrime n)) ns

//Start = removeNotPrime [1..10] // [1,4,6,8,9,10]
//Start = removeNotPrime [13..20] // [14,15,16,18,20]
//Start = removeNotPrime [2,4,8,9,10,23] // [4,8,9,10]
Start = removeNotPrime [] // []
