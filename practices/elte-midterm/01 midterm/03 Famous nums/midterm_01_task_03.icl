module midterm_01_task_03

import StdEnv

/* 3. Famous nums

 Given a list of integers, write a function which gets rid of 
 the numbers that is occurring
 less than 5 times in the list.
*/

/*
Strategy:
	1. Create a list of unique numbers
	2. Count the frequency of each number
	3. If a number appears less than five times,
		remove all of it.
*/
countFreq :: Int [Int] -> Int
countFreq target list = length (filter pred list)
where 
	pred :: Int -> Bool
	pred value = value == target

famousNum :: [Int] -> [Int]
famousNum list = remove_infamous list (removeDup list)
where
	do_remove :: Int [Int] -> [Int]
	do_remove target res
	| (countFreq target res) > 4 = res
	| otherwise = filter pred res
	where
		pred i = i <> target
	remove_infamous :: [Int] [Int] -> [Int]
	remove_infamous res targets
	| targets == [] = res
	| otherwise = remove_infamous (do_remove tar_h res) tar_t
	where 
		[tar_h:tar_t] = targets
	

Start = famousNum [1,1,1,1,1,1,2,3,4,4,4,4,5,5,5,5,5] // [1,1,1,1,1,1,5,5,5,5,5]
//Start = famousNum [] // []
//Start = famousNum [1,2,3,4,5,6,1,1,1,2,2,2,2,1,1,5,10,3] // [1,2,1,1,1,2,2,2,2,1,1]
