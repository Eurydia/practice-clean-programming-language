module ex_10
import StdEnv

// 10. Extract the middle element of a non-empty list. E.g. for [1..5] is 3, for [1..4] is 3.
middle :: [Int] -> Int
middle [] = 0
middle ns = ns !! (size / 2)
where
	size = length ns
	

//Start = middle [1..5] 
//Start = middle [1..4] 
//Start = middle [1]
//Start = middle []