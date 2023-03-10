module week_01_exercise_17
import StdEnv

// 17. Check if a number is divisible by 9! (using sumDigits)
// a number is divisible by 9 is the sum of digits is divisible by 9
div9 :: Int -> Bool
div9 n = ((sumDigits n) rem 9) == 0

//Start = div9 81 // True
//Start = div9 800 // False