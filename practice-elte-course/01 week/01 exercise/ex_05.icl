module ex_05
import StdEnv

// 5. Check if a number is the sum of two other given numbers in any order.
issum :: Int Int Int -> Bool
issum x y z = ((x + y) == z) || ((x + z) == y) || ((y + z) == x) 

//Start = issum 10 6 3  // False
//Start = issum 10 6 4  // True