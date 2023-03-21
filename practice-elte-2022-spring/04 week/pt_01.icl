module pt_01

import StdEnv

/* count the number of zeros and ones in a given positive integer number*/

count :: Int -> Int
count n = length (filter isOneOrIsZero digits)
where
	digits :: [Char]
	digits = [d \\ d <-: (toString n)]
	
	isOneOrIsZero :: Char -> Bool
	isOneOrIsZero d = d == '0' || d == '1'


//Start = count 110101045 // 7
//Start = count 10104511000 // 9
//Start = count 10000010 // 8
//Start = count 1 // 1
//Start = count 0 // 1