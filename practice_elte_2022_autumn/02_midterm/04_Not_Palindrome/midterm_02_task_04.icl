module midterm_02_task_04

import StdEnv 

/* 4. Not Palindrome
 Given a list of lists of integers,
 write a function that gets rid of Palindrome numbers.
 A palindrome number is a number that can be read from left to right or
 from right to left and gets the same number, 
 e.g. 12521 is a palindrome number. 
*/
// --------------------------------------------------------------------
// SOLUTION #1
// isPalindrome :: Int -> Bool
// isPalindrome n
// | size > 1 = all (\(index) = (digits !! index) == (r_digits !! index)) [0..(size - 1)]
// | otherwise = False
// where
// 	digits = [digit \\ digit <-: toString n]
// 	r_digits = reverse digits
// 	size = length digits
	
// isNotPalindrome :: Int -> Bool
// isNotPalindrome n = not (isPalindrome n)

// getRidPal :: [[Int]] -> [[Int]]
// getRidPal n_list_list = map filterList n_list_list
// where 
// 	filterList :: [Int] -> [Int]
// 	filterList n_list = filter isNotPalindrome n_list

// SOLUTION #1 END
// --------------------------------------------------------------------

// --------------------------------------------------------------------
// SOLUTION #2

toDigits :: Int -> [Char]
toDigits    n   =  [c \\ c <-: (toString n)]

isNotPal  :: Int -> Bool
isNotPal     n   = not ((toDigits n) == reverse (toDigits n))

removePal :: [Int] -> [Int]
removePal    ls    =  filter isNotPal ls
// removePal    ls    =  [n \\ n <- ls | isNotPal n]


getRidPal :: [[Int]] -> [[Int]]
getRidPal    lls     = [removePal ls  \\ ls <-  lls ]

// SOLUTION #2 ENDs
// --------------------------------------------------------------------


//Start = getRidPal [[1,2,1111],[151,22,3455]] // [[1,2],[3455]]
//Start = getRidPal [[1,222],[151,202,50505]] // [[1],[]]
//Start = getRidPal [[],[22]] // [[],[]]
