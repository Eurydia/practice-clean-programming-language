module ex_15
import StdEnv

// 15. Replicate n>0 times the element of a list e.g. n=3 [3..6] ->
// [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]
faux :: Int Int -> [Int]
faux n times = [n \\ k <- [1..times]]
//Start = faux 3 4

f5 :: Int [Int] -> [[Int]]
f5 times ns = map (\(n) -> faux n times) ns
//Start = f5 3 [3..6]