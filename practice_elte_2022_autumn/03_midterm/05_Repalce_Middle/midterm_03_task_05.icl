module midterm_03_task_05

import StdEnv 

/* 5. Replace middle

 Given a list of lists of integers and an integer, write a function that replaces 
 the middle element with the given integer in every sublist. 
*/

// -------------------------------------------------------------
//  SOLUTION #1
// replaceList :: [Int] Int -> [Int]
// replaceList [] n = [n]
// replaceList ls n = map replace [0..(size - 1)]
// where 
// 	size = length ls
// 	replace :: Int -> Int
// 	replace index
// 	| isOdd size && index == ((size - 1) / 2) = n
// 	| isEven size && index == (size / 2) = n
// 	| otherwise = ls !! index
	

// repMid :: [[Int]] Int -> [[Int]]
// repMid lls n = map (\(ls) = replaceList ls n) lls
//  SOLUTION #1 END
// -------------------------------------------------------------

// -------------------------------------------------------------
//  SOLUTION #2
repMid :: [[Int]] Int -> [[Int]]
repMid    lls     n   =  [updateAt ((length ls) / 2) n ls \\ ls <- lls]
//  SOLUTION #2 END
// -------------------------------------------------------------


//Start = repMid [[1,2,3],[1..4]] 10 // [[1,10,3],[1,2,10,4]]
//Start = repMid [[1..6], [9,8..1], [(-1),(-2)..(-10)]] 5 
          // [[1,2,3,5,5,6],[9,8,7,6,5,4,3,2,1],[-1,-2,-3,-4,-5,5,-7,-8,-9,-10]]
Start = repMid [[1,3],[]] 5 // [[1,5],[5]]
