module week_01_exercise_01
import StdEnv

// 1. Define a function maxi with two arguments that delivers the maximum of the two.
maxi :: Int Int -> Int
maxi x y
| x > y = x
| x < y = y
= y 

//Start = maxi 34 56 // 56