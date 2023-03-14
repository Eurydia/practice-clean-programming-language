
module hw_01
import StdEnv



//Please write your neptun code here: B9XP3X
/*
Your submission should not have any errors when running the code.

It is possible to get partial points for not working code, but please make sure you comment out the errors.

You should not delete anything from the given code, given test cases should stay the same, but you can add
your tests as well. Don't change the given function signatures, however, you can add as many functions as
you wish, just make sure to name them appropriately (if function squares the number, call it 'square',
'second_power', etc. and not 'f' or 'g'). The same goes for variable names.

Make sure that you comment all 'Start'-s before submitting the code.


Hints:
    1. The basis of functional programming is functions , if a problem can't be solved
    with one function divide it into multiple functions.
    2. To abort with a message you can use the 'abort' function.
    3. The logic needs to be thought by you , the implementation you can figure out
    by going through lecture slides and practice material.
*/


// SOLVE TWO OF THE FOLLOWING TASKS:


//1
/*
    Given a positive integer number, return the following:
    sum of the even digits in the number -  the sum of the odd digits.
    Example:
    Input: 123.
    Output: -2.
    Explanation:
        sum of even digits in the number 123 equals 2.
        sum of odd digits in the number 123 equals 1 + 3 = 4.
        result 2 - 4 = -2.
*/


sumOfEvenDigitsMinusSumOfOddDigits :: Int -> Int
sumOfEvenDigitsMinusSumOfOddDigits a = sumEvenDigits - sumOddDigits 
where
	digits = [(toInt d) - 48 \\ d <-: (toString a)]
	
	sumEvenDigits :: Int
	sumEvenDigits = sum (filter pred digits) 
	where
		pred :: Int -> Bool
		pred n = (n rem 2) == 0
	
	sumOddDigits :: Int
	sumOddDigits = sum (filter pred digits)
	where
		pred :: Int -> Bool
		pred n = (n rem 2) == 1

//Start  = sumOfEvenDigitsMinusSumOfOddDigits  123 // -2
//Start  = sumOfEvenDigitsMinusSumOfOddDigits  222 // 6
// Start  = sumOfEvenDigitsMinusSumOfOddDigits  5484 // 11
// Start  = sumOfEvenDigitsMinusSumOfOddDigits  1 // -1
// Start  = sumOfEvenDigitsMinusSumOfOddDigits  2 // 2


// 2
/*
    Given a positive integer number, find the largest digit in the given input.
    Example:
        Input: 1875.
        Output: 8.
        Explanation: digits of the number 1875 are 1,8,7 and 5.
                     the largest among these digits is 8.
*/

largestDigit :: Int -> Int
largestDigit n = reverse (sort [(toInt d) - 48 \\ d <-: (toString n)]) !! 0

//Start = largestDigit 154 // 5
//Start = largestDigit 12487 // 8
//Start = largestDigit 1 // 1
//Start = largestDigit 29 // 9
//Start = largestDigit 7079 // 9

//3
/*
    Given a positive integer number and a char which can be either 's' or 'm'.
    Based on the given char :
        case 's': return the sum of the digits of the number.
        case 'm': return the multiplication of the digits of the number.
*/

task3 :: Int Char -> Int
task3 a ch
| ch == 's' = doSum digits
| ch == 'm' = doMul digits
where
	digits :: [Int]
	digits = [(toInt d) - 48 \\ d <-: (toString a)]

	doSum :: Int -> Int
	doSum ds = sum ds 

	doMul :: Int -> Int
	doMul ds = prod ds

//Start = task3 123 's' // 6
//Start = task3 124 'm' // 8
//Start = task3 12345 'm' // 120
Start = task3 1234 's' // 10
