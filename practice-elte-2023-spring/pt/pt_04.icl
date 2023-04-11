module pt_04

import StdEnv

// NEPTUNE: B9XP3X

/*
Given the list of numbers, find how many of them
are inside of interval [L,R] (L and R are given
as arguments), after function f(x)=x^2-12*x+3 is
applied to each of them.
*/

f :: [Int] Int Int -> Int
f ns start end = length (filter isGood (map fn ns))
where
	isGood :: Int -> Bool
	isGood n = n >= start && n <= end
	
	fn :: Int -> Int
	fn n = (n ^ 2) - (12 * n) + 3
	

//Start = f [1..10] -30 -20 // 4
// Start = f [1,4..100] 0 1000 // 9
// Start = f [-100,-97..100] -100 100 // 8
 Start = f [1..1000] 0 100000 // 311
