module midterm_02_task_09

import StdEnv 


/* 9. Symmetrical lists
 Given a list of lists of integers, write a function 
 which returns a list of symmetrical lists, 
 if the sum of the sublist is greater than 10.
*/


createSymmetric :: [Int] -> [Int]
createSymmetric ls = ls ++ (reverse ls)

symSumGreater10 :: [[Int]] -> [[Int]]
symSumGreater10 lls = [createSymmetric ls \\ ls <- lls | sum ls > 10 ]

//Start = symSumGreater10 [[1,2,3],[3,4,5,6],[4,5,1,2]] // [[3,4,5,6,6,5,4,3],[4,5,1,2,2,1,5,4]]
//Start = symSumGreater10 [] // []
Start = symSumGreater10 [[1..10],[1,2]] // [[1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,3,2,1]]
