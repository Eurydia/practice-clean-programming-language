module ex_18
import StdEnv

// 18. Delete an element n from a list
del :: Int [Int] -> [Int]
del x ns = filter (\(n) = n <> x) ns

//Start = del 5 [1, 5, 6, 7, 5, 8, 5] // [1, 6, 7, 8]