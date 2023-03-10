module week_01_exercise_14
import StdEnv

// 14. Add the numbers from 1..N in a recursive function, where N is positive.
addn :: Int -> Int
addn n = addn_inner n 0
where
	addn_inner :: Int Int -> Int
	addn_inner curr accu
	| curr == 0 = accu
	| curr > 0 = addn_inner (curr - 1) (accu + curr)
	

//Start = addn 5
// 5 + addn 4
// 5 + 4 + addn 3
// 5 + 4 + 3 + addn 2
// 5 + 4 + 3 + 2 + addn 1 
// 5 + 4 + 3 + 2 + 1
// 15
//Start = addn -10 // N can not be zero or negative
//Start = addn 0 // N can not be zero or negative