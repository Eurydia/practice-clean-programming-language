module ex_25
import StdEnv

// 25. Keep the last elements of the sublists of a list in one list (the sublists are not empty).
// [[1,2,3],[5,6],[1],[7,8,9,10]] -> [3,6,1,10]
lasts :: [[Int]] -> [Int]
lasts nss = [last ns \\ ns <- nss]

//Start = lasts [[1,2,3],[5,6],[1],[7,8,9,10]]