module ex_15
import StdEnv

// 15. Compute the cube of a number.
cube :: Int -> Int
cube n = n  ^ 3

//Start = cube 4  // 64
//Start = cube 8  // 512

cube2 :: Int -> Int
cube2 n = n * n * n 
//Start = cube2 4 // 64