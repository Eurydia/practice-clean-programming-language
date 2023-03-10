module ex_13
import StdEnv

// 13. Given two integers and a boolean value. 
// Check if the first integer is even, the second divisible by 13 
// and the boolean value is True

check :: Int Int Bool -> Bool
check a b bool = bool && ((a rem 2) == 0) && ((b rem 13) == 0)

// long version
//| (isEven a) && (b rem 13 == 0) && boolean == True  
//| otherwise  = False

//Start = check 4 26 True // True
//Start = check 5 26 True // False
//Start = check 5 23 True // False
//Start = check 4 26 False // False
//Start = check 6 26 False // False