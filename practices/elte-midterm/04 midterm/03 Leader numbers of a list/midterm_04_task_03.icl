module midterm_04_task_03

import StdEnv


//// Leader numbers of a list
/*3.
Given a list of integer numbers, return all the leaders in the list.
A number is leader if it is strictly greater than all the elements
to its right side in a list.
Example: [10,9,14,23,15,0,9] -> [23,15,9]
23 is greater than all the numbers to its right 15,0,9.
15 is greater than all the numbers to its right 0,9.
9 there are no numbers in its right.
*/

leaders :: [Int] -> [Int]
leaders ns = [ns !! i \\ i <- (filter compareRight [0..(size - 1)])]
where
	size = length ns
	compareRight :: Int -> Bool
	compareRight index = all (\(n) = curr > n) [ns !! i \\ i <- [(index + 1)..(size - 1)] ]
	where 
		curr = ns !! index

//Start = leaders [10,9,14,23,15,0,9] // [23,15,9]
//Start = leaders [1..10] // [10]
//Start = leaders [10,9..1] // [10,9,8,7,6,5,4,3,2,1]
//Start = leaders [7,8,10,9,5,3,6,4] // [10,9,6,4]
Start = leaders [] // []
