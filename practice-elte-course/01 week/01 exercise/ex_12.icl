module ex_12
import StdEnv

// 12. Given three integer numbers a, b and c. 
// Check if both a and b have the same remainder when divided by c.
sameRem :: Int Int Int -> Bool
sameRem a b c = (a rem c) == (b rem c)

//Start = sameRem 12 4 4 // True
//Start = sameRem 12 4 3 // False
//Start = sameRem 13 4 3 // False (?????)