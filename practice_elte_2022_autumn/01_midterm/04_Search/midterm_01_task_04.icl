module midterm_01_task_04

import StdEnv

/*4. Search
 
 Implement a search algorithm that searches through a list for Int n and returns the value in the list before n. 
 If there is no value, or the list is empty, return -1. e.g., findPrev 5 [1,2,3,4,5,6] should return 4, 
 while findPrev 5 [0, 10, 20, 30] returns -1.
*/

// ---------------------------------------
// SOLUTION #1

findPrev :: Int [Int] -> Int
findPrev target [] = -1
findPrev target list
| index < 1 = -1
| otherwise = list !! (index - 1)
where 
	index = find list zero
	
	find :: [Int] Int -> Int
	find [h:t] res
	| [h:t] == [] = -1
	| h == target = res
	| otherwise = find t (res + 1)
// SOLUTION #1 END
// ---------------------------------------

// ---------------------------------------
// SOLUTION #2
findPrev :: Int [Int] -> Int
findPrev    t   xs
| candidates == [] = -1
| otherwise = hd candidates
where
	candidates :: [Int]
	candidates = [ xs !! i \\  i <- [0..len] | (xs !! (i + 1)) == t]

	len :: Int
	len = (length xs) - 2

//     [1,2,3,4,5,6,5]
//i=0  ^             []
//i=1    ^           []
//i=2      ^         []
//i=3        ^       [4]
//i=4          ^     [4]
//i=5            ^   [4,6]
//i=6              ^
// SOLUTION #2 END`
// ---------------------------------------



//Start = findPrev 5 [1,2,3,4,5,6] // 4
//Start = findPrev 1 [1,2,3,4,5,6] // -1
Start = findPrev 1 [] // -1 
