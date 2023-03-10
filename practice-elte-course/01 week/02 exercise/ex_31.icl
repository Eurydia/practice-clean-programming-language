module ex_31
import StdEnv

// 31. using notempty eliminate the empty lists: 
// [[1,2,3],[],[3,4,5],[2,2],[],[],[]] -> [[1,2,3], [3,4,5], [2,2]]

//notempty :: [Int] -> Bool


f8 :: [[Int]] -> [[Int]]
f8 nss = filter (\(ns) -> (length ns) > 0) nss
Start = f8 [[1,2,3],[],[3,4,5],[2,2],[],[],[]]