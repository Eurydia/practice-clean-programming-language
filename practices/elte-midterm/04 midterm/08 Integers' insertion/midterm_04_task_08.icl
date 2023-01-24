module midterm_04_task_08

import StdEnv

//// Integers' insertion
/*8.
Given two integers, insert the second integer into the first one.
After each digit considered in the first integer, insert a digit
from the second integer. Both given numbers are of equal length.
Example: 123 321 -> 132231
13 13 -> 1133
*/

intInsertion :: Int Int -> Int
intInsertion a b = sum (map insert [0..((size * 2) - 1)])
where
	a_digits = [((toInt d) - 48) \\ d <-: (toString a)]
	b_digits = [((toInt d) - 48) \\ d <-: (toString b)]
	size = length a_digits
	
	insert :: Int -> Int
	insert index
	| isOdd index = (b_digits !! ((index - 1) / 2)) * tens
	| otherwise = (a_digits !! (index / 2)) * tens
	where
		tens = 10 ^ ((size * 2) - index - 1) 
		
		
//Start = intInsertion 123 123 // 112233
//Start = intInsertion 123 321 // 132231
Start = intInsertion 13 13 // 1133
//Start = intInsertion 1 2 // 12
//Start = intInsertion 2 1 // 21
