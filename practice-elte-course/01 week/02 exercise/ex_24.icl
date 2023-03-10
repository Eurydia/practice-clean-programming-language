module ex_24
import StdEnv

// 24. Reverse every sublist of a list 
revsub :: [[Int]] ->  [[Int]]
revsub nss = map reverse nss

//Start = revsub [[1,2,3],[5,6],[],[7,8,9,10]]