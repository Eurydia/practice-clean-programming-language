module midterm_01_task_05

import StdEnv

/* 5. Symmetric difference 

 Given two lists of integer numbers , return a sorted list containing the symmetric difference of the two lists; 
 The symmetric difference of two lists A and B is the list (A - B) U (B - A); 
 where A - B is The difference of two lists  defined as follows:  
 The List A-B consists of elements that are in A but not in B.
 And (U) the union of two lists is a list containing all the elements of A and B without duplicates 
*/

// --------------------------------------------------------
// SOLUTION #1
// findMin :: [Int] [Int] -> Int
// findMin list_a list_b = min min_a min_b
// where
// 	min_a = minList list_a
// 	min_b = minList list_b

// findMax :: [Int] [Int] -> Int
// findMax list_a list_b = max max_a max_b
// where
// 	max_a = maxList list_a
// 	max_b = maxList list_b

// findValue :: Int [Int] -> Int
// findValue target [] = 0
// findValue target [h:t]
// | target == h = 1
// | otherwise = findValue target t

// symmetricDif :: [Int] [Int] -> [Int]
// symmetricDif list_a list_b = filter sym_diff [min_x..max_x]
// where
// 	min_x = findMin list_a list_b
// 	max_x = findMax list_a list_b
	
// 	sym_diff :: Int -> Bool
// 	sym_diff target
// 	| sum_x == 1 = True
// 	| otherwise = False
// 	where 
// 		sum_x = (findValue target list_a) + 
// 				(findValue target list_b)  

// SOLUTION #1 END
// --------------------------------------------------------

// --------------------------------------------------------
//SOLUTION #2

//symmetricDif :: [Int] [Int] -> [Int]
//symmetricDif a b = (removeMembers a b) ++ (removeMembers b a)

//SOLUTION #2 END
// --------------------------------------------------------


// --------------------------------------------------------
//SOLUTION #3

symmetricDif :: [Int] [Int] -> [Int]
symmetricDif a b = [el \\ el <- (a ++ b) | not ((isMember el a) && (isMember el b))]

//SOLUTION #3 END
// --------------------------------------------------------

Start = symmetricDif  [1,2,3,4,5] [2,4,6] //  [1,3,5,6]
//Start = symmetricDif  [1..5] [1..10] // [6,7,8,9,10]
//Start = symmetricDif  [1..5] [] // [1,2,3,4,5]