module midterm_03_task_09

import StdEnv 


/* 9. Powers 
 Given a list of integers and an integer, write a function which returns a list 
 which only contains the powers of the integer.
*/

isPowerOf :: Int Int -> Bool
isPowerOf n k = checkPower zero
where
	checkPower :: Int -> Bool
	checkPower p
	| n ^ p < k = checkPower (p + 1)
	| n ^ p > k = False
	| otherwise = True

powersList :: [Int] Int -> [Int]
powersList ns k = filter (\(n) = isPowerOf k n) ns

Start = powersList [2,4,8,16,32,33,55] 2 // [2,4,8,16,32]
//Start = powersList [] 3 // []
//Start = powersList [1..10] 3 // [1,3,9]
//Start = powersList [-1,-2,4,8] 4 // [4]

