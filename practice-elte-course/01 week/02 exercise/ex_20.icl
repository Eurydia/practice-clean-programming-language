module ex_20
import StdEnv

// 20. Delete the first and the last element of a list.
del_firstlast :: [Int] -> [Int]
del_firstlast ns
| size <= 2 = []
= [ns !! index \\ index <- [1..(size - 2)]]
where
	size = length ns

//Start = del_firstlast [1..10]

//del_firstlast2 :: [Int] -> [Int]

//Start = del_firstlast2 [1..10]
//Start = del_firstlast2 []
//Start = del_firstlast2 [1]