module week_01_exercise_04
import StdEnv

// 4. Check if a number is odd.
isoddnr :: Int -> Bool  // isEven, isOdd built-in functiona
isoddnr n = (n rem 2) == 1

//Start = isoddnr 6 // False
//Start = isoddnr 21 // True