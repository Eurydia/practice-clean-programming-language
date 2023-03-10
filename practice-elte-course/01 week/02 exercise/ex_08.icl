module ex_08
import StdEnv

// 8. Cut a list in two parts at the middle. 
// E.g. cut [1..10] -> [[1,2,3,4,5],[6,7,8,9,10]]
// and for cut [1..11] the result is [[1,2,3,4,5],[6,7,8,9,10,11]].
splice :: [Int] Int Int -> [Int]
splice ns first last = [ns !! index \\ index <- [first..last]]

cut :: [Int] -> [[Int]]
cut ns = [left, right]

where
	size = length ns
	left = splice ns 0 ((size / 2) - 1)
	right = splice ns (size / 2) (size - 1)


//Start = cut [1..10]
//Start = cut [1..11]
//Start = cut []
//Start = cut [1]