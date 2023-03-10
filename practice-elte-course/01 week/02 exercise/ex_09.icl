module ex_09
import StdEnv

// 9. Test if a list is symmetrical
sim :: [Int] -> Bool
sim ns = all (\(b) = b) [ns !! index == ns_reverse !! index \\ index <- [0..((size / 2) + 1)]] 
where
	size = length ns
	ns_reverse = reverse ns

//Start = sim [1, 2, 1]
//Start = sim [1, 2, 3,4,5]