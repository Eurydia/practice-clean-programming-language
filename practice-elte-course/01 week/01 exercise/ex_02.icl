module ex_02
import StdEnv

// 2. Define a function mini that has two arguments that delivers the minimum of the two.
//mini :: Int Int -> Int
mini x y
| x > y = y
| x < y = x
= y

//Start = mini 34 56  // 34