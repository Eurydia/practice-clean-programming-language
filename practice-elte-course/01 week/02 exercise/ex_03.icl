module ex_03
import StdEnv

// 3. sumsq n returns 1*1 + 2*2 + ... + n*n - with a pattern for 0
sumsq :: Int -> Int
sumsq n = sum [x * x \\ x <- [0..n]]

//Start = sumsq 3 // 14


// version 2. - without pattern for 0
sums :: Int -> Int
sums n = sum [x * x \\ x <- [1..n]]

//Start = sums 3