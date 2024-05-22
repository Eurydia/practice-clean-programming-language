module usefulmacros
import StdEnv

// 1. Converting an integer into a list of digits (Short way)
intToDigits :: Int -> [Int]
intToDigits    n	=> [toInt (ch - '0') \\ ch <-: (toString n)]

// 2. Converting a list of integers into an integer
// [1,2,3,4] -> [1 * 1000, 2 * 100, 3* 10, 4 *1] -> sum
digitListToInt :: [Int] -> Int
digitListToInt    ns 	=> sum [x * (10^i) \\ i <- [0..] & x <- reverse ns]
// Start = digitListToInt [1,1,2,2,3,3]

// 3. Indexing an first occurence of an element in a list
indexOf :: a [a] -> Int | == a
indexOf    x ls
| isMember x ls => hd [i \\ y <- ls & i <- [0..] | x == y ] 
| otherwise     => abort "Cannot find element in list"
