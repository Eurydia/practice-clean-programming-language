module midterm_02_task_02

import StdEnv 

/* 2. Occurrences

 Given a list of integers, replace every element in the list with its number
 of occurrences in the list.
*/

//-------------------------------------------
// SOLUTION #1
// getOccurrences :: [Int] -> [Int]
// getOccurrences n_list = [getOccurence n \\ n <- [1..9]]
// where
// 	getOccurence :: Int -> Int
// 	getOccurence n = length (filter ((==) n) n_list)

// occNum :: [Int] -> [Int]
// occNum targets =  [occ !! (n - 1) \\ n <- targets]
// where 
// 	occ = getOccurrences targets
// SOLUTION #1 END
//-------------------------------------------

//-------------------------------------------
// SOLUTION #2

occurenceOf :: Int [Int] -> Int
occurenceOf    x   list  =  length (filter ((==) x) list) // [1,1,1,1]

occNum :: [Int] -> [Int]
occNum    xs    =  [(occurenceOf x xs) \\ x <- xs]


// SOLUTION #2 END
//-------------------------------------------

// Start = occNum [1,1,1,1,2,3,2,5,6,2,2,2,5] // [4,4,4,4,5,1,5,2,1,5,5,5,2]
// Start = occNum [1..5] // [1,1,1,1,1]
// Start = occNum ([1..5] ++ [1..7]) // [2,2,2,2,2,2,2,2,2,2,1,1]
Start = occNum([7..9] ++ [7..9] ++ [7..9]) // [3,3,3,3,3,3,3,3,3]

