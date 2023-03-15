module midterm_03_task_01

import StdEnv

/* 1. Parasitic Number

 A Parasitic number (in base 10) is a positive number which can be multiplied 
 by a certain n by moving the rightmost digit of its decimal representation 
 to the front.
 e.g. 102564 � 4 = 410256
 Given a positive integer number and n, write a function to determine whether 
 it is a Parasitic number or not.
*/


parasitic :: Int Int -> Bool
parasitic x n = x_digits == y_digits
where
 	y = x * n
	x_digits = [d \\ d <-: (toString x)]
	[y_head:y_rest] = [d \\ d <-: (toString y)]
	y_digits = y_rest ++ [y_head]

//Start = parasitic 102564 4 // True
//Start = parasitic 142857 5 // True
Start = parasitic 714285 8 // False
//Start = parasitic 105263157894736842 2 // True
