module ex_14
import StdEnv

// 14. write a function for the square of every element of a list and sublists
// [[1,2],[3,4,5,6],[7,8]]  -> [[1,4],[9,16,25,36],[49,64]]  

sq :: [Int] -> [Int]
sq ns = [n * n \\ n <- ns]

//Start = sq [1..5]


f4 :: [[Int]] -> [[Int]]
f4 nss = map sq nss

//Start = f4 [[1,2],[3,4,5,6],[7,8]] // [[1,4],[9,16,25,36],[49,64]]