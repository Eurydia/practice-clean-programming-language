module ex_07
import StdEnv

// 7. write a funtion which returns true if a is divisible by b or vice versa
div_any :: Int Int -> Bool
div_any a b = ((a rem b) == 0) || ((b rem a) == 0)

//a rem b == 0 || b rem a == 0

//Start = div_any 4 16     // True