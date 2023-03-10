module week_01_exercise_11
import StdEnv

// 11. Given an integer, write a function that returns the last digit.

lastDigit :: Int -> Int
lastDigit n = last [toInt(c) - 48 \\ c <-: (toString n)]

//Start = lastDigit 124 // 4
//Start = lastDigit 4000 // 0
//Start = lastDigit 123442 // 2