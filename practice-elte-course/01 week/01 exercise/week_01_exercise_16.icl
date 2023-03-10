module week_01_exercise_16
import StdEnv

// 16. Add the digits of a number e.g. for 123 is 6.
sumDigits :: Int -> Int
sumDigits n = sum [toInt(c) - 48 \\ c <-: toString(n_inner)]
where 
	n_inner
	| n < 0 = n * (-1)
	= n

//Start = sumDigits 12345 // 15
// 5 + sumDigits 12345/10  =  5 + sumDigits 1234
// 5 + 4 + sumDigits 1234/10 =  5 + 4 + sumDigits 123
// 5 + 4 + 3 + sumDigits 123/10 =  5 + 4 + 3 + sumDigits 12 
// 5 + 4 + 3 + 2 + sumDigits 12/10 =  5 + 4 + 3 + 2 + sumDigits 1 
// 5 + 4 + 3 + 2 + 1
// 15

//Start = sumDigits 5 // 5
//Start = sumDigits -54 // 9