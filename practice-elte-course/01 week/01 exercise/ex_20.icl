module ex_20
import StdEnv

// 20. Compute factorial n recursively, where n! = n*(n-1)! .
factor :: Int -> Int
factor 0 = 1
factor n = n * factor (n - 1)

//Start = factor 5 // 120
// factor 5
// 5 * factor 4
// 5 * 4 * factor 3
// 5 * 4 * 3 * factor 2
// 5 * 4 * 3 * 2 * factor 1
// 5 * 4 * 3 * 2 * 1 * factor 0
// 5 * 4 * 3 * 2 * 1 * 1
// 120


//(???????)
countDigits :: Int -> Int
countDigits x = sum [1 \\ c <-: toString(x)]

//Start = countDigits 456 // 3