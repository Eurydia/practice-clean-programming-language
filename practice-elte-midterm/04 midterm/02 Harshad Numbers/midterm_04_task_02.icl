module midterm_04_task_02

import StdEnv

//// Harshad numbers
/*2.
Given a list of positive integer numbers, return a list that
contains the Harshad numbers of the list.
A Harshad number is an integer that is divisible by the sum of
its digits when written in that base.
Examples:
200 True, the sum of digits is 2+0+0=2 and 200 is divisible by 2.
171 True, the sum of digits is 1+7+1=9 and 171 is divisible by 9.
*/

isHarshad :: Int -> Bool
isHarshad n = n rem (sum [((toInt d) - 48) \\ d <-: (toString n )]) == 0

harshadNums :: [Int] -> [Int]
harshadNums ns = filter isHarshad ns

//Start = harshadNums ([8, 9, 10, 12, 18, 20, 21, 24, 27, 30] ++ [13..17]) // [8, 9, 10, 12, 18, 20, 21, 24, 27, 30]
//Start = harshadNums ([31..35] ++ [36, 17,40, 42, 45, 13, 48, 50, 54, 11, 60, 63]) // [36, 40, 42, 45, 48, 50, 54, 60, 63]
Start = harshadNums [] // []


