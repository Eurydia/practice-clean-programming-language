module ex_26
import StdEnv

// 26. Insert 0 in front of every sublist of a list.
// E.g. for [[1,2,3],[5,6],[],[7,8,9,10]] the result is [[0,1,2,3],[0,5,6],[0],[0,7,8,9,10]]
ins0 :: [[Int]] -> [[Int]]
ins0 nss = [[0] ++ ns \\ ns <- nss]
//Start = ins0 [[1,2,3],[5,6],[],[7,8,9,10]]

//ins02 :: [[Int]] -> [[Int]]

//Start = ins02 [[1,2,3],[5,6],[],[7,8,9,10]]