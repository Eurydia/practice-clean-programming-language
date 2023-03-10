module ex_27
import StdEnv

// 27. Delete the last element of each sublist of a list.
// E.g. for [[1,2,3],[5,6],[],[7,8,9,10]] the result is [[1,2],[5],[],[7,8,9]]
lastdel :: [[Int]] -> [[Int]]
lastdel nss = [splice ns 0 ((length ns) - 2) \\ ns <- nss]

//Start = lastdel [[1,2,3],[5,6],[],[7,8,9,10]]