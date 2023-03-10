module ex_12
import StdEnv

// 12. compute the double of the positive elements of a list [1, 2, -2, 3, -4] -> [2, 4, 6]
f2 :: [Int] -> [Int]
f2 ns = [n * 2 \\ n <- (filter (\(x) = x > 0) ns)]
//Start = f2 [1, 2, -2, 3, -4] // [2, 4, 6]