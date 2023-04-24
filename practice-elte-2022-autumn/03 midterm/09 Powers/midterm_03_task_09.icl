module midterm_03_task_09

import StdEnv 


/* 9. Powers 
 Given a list of integers and an integer, write a function which returns a list 
 which only contains the powers of the integer.
*/

isPowerOf :: Int Int -> Bool
isPowerOf    n   k   =  checkPower 0
where
	checkPower :: Int -> Bool
	checkPower    p
	| (n ^ p) < k       = checkPower (p + 1)
	| (n ^ p) > k       = False
	| otherwise       = True

// n = 9; k = 2;
// p = 0; (2 ^ 0) < 9
// p = 1; (2 ^ 1) < 9
// p = 2; (2 ^ 2) < 9
// p = 3; (2 ^ 3) < 9
// p = 4; (2 ^ 4) > 9

// n = 8; k = 2;
// p = 0; (2 ^ 0) < 8
// p = 1; (2 ^ 1) < 8
// p = 2; (2 ^ 2) < 8
// p = 3; (2 ^ 3) == 8


powersList :: [Int] Int -> [Int]
powersList    ns    k   =  [n \\ n <- ns | isPowerOf n k]

Start = powersList [2,4,8,16,32,33,55] 2 // [2,4,8,16,32]
//Start = powersList [] 3 // []
//Start = powersList [1..10] 3 // [1,3,9]
//Start = powersList [-1,-2,4,8] 4 // [4]

