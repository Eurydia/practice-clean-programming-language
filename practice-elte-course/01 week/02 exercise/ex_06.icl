module ex_06
import StdEnv

// 6. write a funtion which returns true if a is divisible by b
div_by :: Int Int -> Bool
div_by a b = (a rem b) == 0

//Start = div_by 16 4      // True