module midterm_04_task_05

import StdEnv

//// GoodNumbers
/*5.
Write a function that takes a list as an argument and
counts how many numbers are:
greater or equal to 10 AND less or equal to 99 AND divisible by 3.
*/

isGoodNumber :: Int -> Bool
isGoodNumber n
| n < 10 = False
| n > 99 = False
| otherwise = ((n rem 3) == 0)

countGoodNums :: [Int] -> Int
countGoodNums ns = length (filter isGoodNumber ns)

//Start = countGoodNums [1,12,10,99] // 2
//Start = countGoodNums [12,15,30,33,39,96,99] // 7
//Start = countGoodNums [9, 10, 100, 102, 105] // 0
Start = countGoodNums [] // 0
