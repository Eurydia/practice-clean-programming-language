module hw_06

import StdEnv

// B9XP3X

/*1. Given the list of integers, modify it in the following way:
I. Remove all numbers which are multiple of 3
II. Sort the remaining list in descending order
III. Swap 1st and 2nd elements, 3rd and 4th, 5th and 6th, etc.
*/
 
shuffleSort :: [Int] -> [Int]
shuffleSort ns = reorder (sortDesc (filter pred ns))
where
    pred :: Int -> Bool
    pred n = (n rem 3) <> 0

    sortDesc :: [Int] -> [Int]
    sortDesc ls = reverse (sort ls)

    reorder :: [Int] -> [Int]
    reorder []  = []
    reorder [x] = [x]
    reorder [x, y:rest] = [y, x] ++ (reorder rest)
 
//Start = shuffleSort [4,3,2] // [2,4]
//Start = shuffleSort [4,1,3,2,5,6,7] // [5,7,2,4,1]
//Start = shuffleSort [3,6,3,9,12] // []
//Start = shuffleSort [2,4,5,7,14,17] // [14,17,5,7,2,4]
//Start = shuffleSort [] // []


/*2. Given a list of lists of real numbers, for every sublist   find the item in the  sublist which is closest
to the average of the sublist.
e.g [[1.3, 5.2, 7.7, -2.3, 23.45] , [3.0,8.4] ] ->  avg of [1.3, 5.2, 7.7, -2.3, 23.45]  is 7.07 so the closest value from the list is  7.7
similarly, avg of [3.0,8.4] is 5.7  so the closest value from the list is  3.0
*/

// findClosest :: [Real] -> Real
// findClosest ls = minOf (sortData (differences ls target))
// where
//     target :: Real
//     target = avg ls

//     differences :: [Real] Real -> [(Real, Int)]
//     differences ns t = [(abs (t - n), i) \\ i <- (indexList ns) & n <- ns]

//     sortData :: [(Real, Int)] -> [(Real, Int)]
//     sortData ns = sortBy rule ns
    
//     rule :: (Real, Int) (Real, Int) -> Bool
//     rule (ax, _) (bx, _) = ax < bx

//     minOf :: [(Real, Int)] -> Real
//     minOf ns = ls !! (snd (hd ns))

findClosest :: [Real] -> Real
findClosest    ls     = hd candidates
where
    candidates :: [Real]
    candidates =  [n \\ n <- ls | abs (avgL - n) == closest]
    closest    :: Real
    closest    =  hd (sort [abs (avgL - n) \\ n <- ls])
    avgL       :: Real
    avgL       =  avg ls

closestToAvg :: [[Real]] -> [Real]
closestToAvg lls = map findClosest lls



//Start = closestToAvg [[1.3, 5.2, 7.7, -2.3, 23.45] , [3.0,8.4] ] //  [7.7,3]
//Start = closestToAvg [[2.4 ,4.5 ,6.7 ,6.6 ,7.7] , [5.6 , 6.8 ,4.8 , 4.1] , [5.5,5.1] , [5.0] , [7.8] ] // [6.6,5.6,5.5,5,7.8]
//Start = closestToAvg [[1.3]] // [1.3]
