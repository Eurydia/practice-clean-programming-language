module midterm_01_task_07

import StdEnv

/* 7.  Gap2 continued 

 Given a list of numbers, return True if the  
 the difference between two consecutive elements is always 2
 otherwise return False
*/

gap2C :: [Int] -> Bool
gap2C [] = False
gap2C arr = all fn [0..((length arr) - 2)]
where
	fn :: Int -> Bool
	fn index = (abs ((arr !! index) - (arr !! (index + 1)))) == 2


Start = gap2C [1,3,5,7] // True
//Start = gap2C [1,3,5,7,9,11,13,15] // True
//Start = gap2C [1,5,8] // False
//Start = gap2C [] // False
