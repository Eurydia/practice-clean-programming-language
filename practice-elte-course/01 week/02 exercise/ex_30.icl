module ex_30
import StdEnv

// 30. filter the elements smaller then n, e.g. n=3 [1,5,3,2,1,6,4,3,2,1] -> [1,2,1,2,1]
f7 :: Int [Int] -> [Int]
f7 x ns = filter (\(n) -> n >= x) ns
//Start = f7 3 [1,5,3,2,1,6,4,3,2,1]