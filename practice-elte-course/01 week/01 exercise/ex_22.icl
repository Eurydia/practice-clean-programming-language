module ex_22
import StdEnv

// 22. Given a positive integer, find the sum of the odd numbers up to that number starting from 1.
sumOdd :: Int -> Int
sumOdd n = sum (filter isOdd [1..n])

//Start = sumOdd 5 // 9 
//Start = sumOdd 21 // 121
//Start = sumOdd 10 // 25 = 9+7+5+3+1
Start = sumOdd -13 // n has to be positive

//sumOdd2 :: Int -> Int
//sumOdd2 n 

//Start = sumOdd2 5 // 9 
//Start = sumOdd2 21 // 121
//Start = sumOdd2 10 // 25
//Start = sumOdd2 -13 // n has to be positive