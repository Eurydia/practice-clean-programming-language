module midterm_02_task_01

import StdEnv
import StdChar

/* 1. Armstrong number

 If sum of cubes of each digit of the number is equal to the number itself,
 then the number is called an Armstrong number.
 153 = 1^3 + 5^3 + 3^3
 Given a positive integer number, write a function to determine whether it is
 an Armstrong number or not.
*/

cube :: Int -> Int
cube n = n * n * n

toNumber :: Char -> Int
toNumber d = (toInt d) - 48

toDigits :: Int -> [Char]
toDigits n = [digit \\ digit <-: (toString n)]

armstrong :: Int -> Bool
armstrong n = (sum (map getCube (toDigits n))) == n
where
	getCube :: Char -> Int
	getCube d = cube (toNumber d)

//Start = armstrong 153 // True
//Start = armstrong 370 // True
//Start = armstrong 0 // True
Start = armstrong 12 // False