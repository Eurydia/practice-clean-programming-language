module chlg_02

import StdEnv

/* 
Write a recursive function to find the longest common subsequence of two lists.
For example, given the lists [1, 2, 3, 4] and [2, 3, 4, 5], the function should
return [2, 3, 4].
*/

isSubSeq :: [Int] [Int] -> Bool
isSubSeq main comp
| lm < lc = False
| lm == lc = main == comp
| otherwise = any isEqual [0..(lm - lc)]
where
	lm :: Int
	lm = length main
	lc :: Int
	lc = length comp
	
	isEqual :: Int -> Bool
	isEqual index = (main % (index, (index + lc - 1))) == comp

// [1, 2, 3, 4, 5] against [4, 5, 6]
// (0, 3 + 0) -> [1, 2, 3]
// (1, 3 + 1) -> [2, 3, 4]

lcs :: [Int] [Int] -> [Int]
lcs main comp
| (length resR) > (length resL) = resR
| otherwise = resL
where
	lcsSub :: [Int] [Int] ([Int] -> [Int]) -> [Int]
	lcsSub m c fn
	| isSubSeq m c = c
	| otherwise = lcsSub m (fn c) fn
	
	// `resR` and `resL` for storing the 
	// result of comparison
	resR :: [Int] 
	resR = lcsSub main comp init
	
	resL :: [Int]
	resL = lcsSub main comp tl
   
Start = lcs [9] [2..5] ++ [9]