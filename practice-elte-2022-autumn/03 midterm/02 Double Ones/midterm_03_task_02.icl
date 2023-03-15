module midterm_03_task_02

import StdEnv 



/* 2. Double Ones

 Given a list of integers, write a function which will keep only the numbers
 that contain at least two '1' digits. For example:
 [1,2,21,121,11,234131,111111,123,0,334] -> [121,11,234131,111111]
*/

hasDoubleOnes :: Int -> Bool
hasDoubleOnes n = length (filter (\(d) = d == '1') digits)  >= 2
where
	digits = [d \\ d <-: (toString n)]


doubleOne :: [Int] -> [Int]
doubleOne ns = filter hasDoubleOnes ns



//Start = doubleOne [1,2,21,121,11,234131,111111,123,0,334] // [121,11,234131,111111]
//Start = doubleOne [12,1,11,33] // [11]
//Start = doubleOne [11,111,21] // [11,111]
//Start = doubleOne [] // []
Start = doubleOne [21,3,1] // []

