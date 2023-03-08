module midterm_03_task_04

import StdEnv 


/* 4. List difference
 
 Given two lists (A and B) containing sublists of integer numbers, 
 both A and B are of the same length,
 for every sublist in A and B, return the difference of the two sublists.  

 The difference is defined as follows:  
 The List L1-L2 consists of elements that are in L1 but not in L2. 
 For example if L1=[1,2,3] and L2=[3,5], then L1-L2=[1,2].
*/

notInList :: Int [Int] -> Bool
notInList n xs = not (any (\(x) = n == x) xs)


diff :: [Int] [Int] -> [Int]
diff as bs = filter (\(a) = notInList a bs) as


difference :: [[Int]] [[Int]] -> [[Int]]
difference als bls = map (\(index) = diff (als !! index) (bls !! index)) [0..((length als) - 1)]

//Start = difference [[1..5]] [[4..7]] // [[1,2,3]]
//Start = difference [[1..10] , [10..15] , [1..4]] [[1..10] , [11..20] , [5]] // [[],[10],[1,2,3,4]]
Start = difference [] [] // [] 
