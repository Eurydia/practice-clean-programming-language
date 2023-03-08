module midterm_03_task_08

import StdEnv

/* 8. Super Digit

 We define super digit of an integer x using the following rules.
 If x has only 1 digit, then its super digit is x.
 Otherwise, the super digit of x is equal to the super digit of the digit-sum of x.
 Here, the digit-sum of a number is defined as the sum of its digits.

 E.g  : super_digit(9875) = super_digit(9+8+7+5) 
                          = super_digit(29) 
                          = super_digit(2+9)
                          = super_digit(11)
                          = super_digit(1+1)
                          = super_digit(2)
                          = 2

 Given a list of integers, return a list containing the super digit
 of every number in the list.  
*/

getSuper :: Int -> Int
getSuper n
| size == 1 = n
| otherwise = getSuper (sum n_digits)
where 
	n_digits = [((toInt d) - 48) \\ d <-: (toString n)]
	size = length n_digits

super_digit :: [Int] -> [Int]
super_digit ns = map getSuper ns

//Start = super_digit [148148148 , 9875] // [3,2]
//Start = super_digit [884555 , 456 , 2351 , 21587 , 88 ] // [8,6,2,5,7]
Start = super_digit [] // [] 

