module ex_11
import StdEnv

// 11. add 3 to every element of a list
f1 :: [Int] -> [Int]
f1 ns = [n + 3 \\ n <- ns]

//Start = f1 [1,5,3,1,6]  // [4,8,6,4,9]