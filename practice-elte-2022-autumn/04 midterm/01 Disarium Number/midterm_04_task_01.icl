module midterm_04_task_01

import StdEnv

//// Disarium number
/*1.
Given a positive integer number, check if the given number
is a Disarium number or not.
A Disarium number is a number defined by the following:
Sum of its digits powered with their respective position
is equal to the original number.
Example: 135 is a Disarium number, 1^1+3^2+5^3 = 135.
*/

isDisariumNum :: Int -> Bool
isDisariumNum    n   =  (sum [d ^ p \\ d <- n_digits & p <- [1..]]) == n
where
	n_digits :: [Int]
	n_digits =  [(toInt d - 48) \\ d <-: (toString n)]

//Start = isDisariumNum 135 // True
//Start = isDisariumNum 598 // True
//Start = isDisariumNum 518 // True
//Start = isDisariumNum 220 // False
Start = isDisariumNum 110 // False


