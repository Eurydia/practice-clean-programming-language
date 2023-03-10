module ex_13
import StdEnv

// 13. write a function that keeps the integers of a list up to the first 0 encounterred 
// and then divides by 2 every element [1, 2, -2, 3, 0, -4] -> [0, 1, -1, 1]
// hints: use takeWhile then map
f3 :: [Int] -> [Int]
f3 ns = [(n / 2) \\ n <- filtered_ns]
where
	filtered_ns =  takeWhile (\(n) = n <> 0) ns 

//Start = f3 [1, 2, -2, 3, 0, -4] // [0, 1, -1, 1]