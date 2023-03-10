module week_01_exercise_07
import StdEnv

// 7. Check if a number is multiple of 10.
ismult10 :: Int -> Bool
ismult10 n = (n rem 10) == 0

//Start = ismult10 20 // True
//Start = ismult10 201 // False

// long version (?????)
//ismult102 :: Int -> Bool
//ismult102 x = (n rem 102) ==  

//Start = ismult102 20 // True
//Start = ismult102 202  // False