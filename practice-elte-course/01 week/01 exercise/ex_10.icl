module ex_10
import StdEnv

// 10. Write a function to compute the absolute value of an integer number.
abs n
| n < 0 = n * (-1)
= n

//Start = abs -4   // 4  abs built-in function

myabs :: Int -> Int
myabs x
| x < 0 = x * (-1)
= x

//Start = myabs -4 // 4
//Start = myabs 8 // 8