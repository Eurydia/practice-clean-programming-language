module ex_01
import StdEnv

// ***

// Write a function that will take a digit (Int)

// and return the respective word for it (String).

// For example input of 1 should output One; input of 0 should output Zero; input of 5 should output Five.

// Anything that is not the digit (0-9) should output "Not a digit"


digit_to_string :: Int -> String
digit_to_string n
| n == 0 = "Zero"
| n == 1 = "One"
| n == 2 = "Two"
| n == 3 = "Three"
| n == 4 = "Four"
| n == 5 = "Five"
| n == 6 = "Six"
| n == 7 = "Seven"
| n == 8 = "Eight"
| n == 9 = "Nine"
| otherwise = "Not a digit"

//Start = digit_to_string 4 //"Four"
//Start = digit_to_string 0 //"Zero"
//Start = digit_to_string 5 //"Five"
//Start = digit_to_string 10 //"Not a digit"
//Start = digit_to_string -1 //"Not a digit"
//Start = digit_to_string 42 //"Not a digit"

// ***

// Write a function that takes Int and checks if this number is prime or not.

// handle the case of negative numbers (negative numbers are not primes).

// 0 and 1 are not prime numbers.

is_prime :: Int -> Bool
is_prime n
| n <= 1 = False
| otherwise = all pred [2..(n-1)]
where
	pred :: Int -> Bool
	pred d = not ((n rem d) == 0)

//Start = is_prime 5 // True
//Start = is_prime 0 // False
//Start = is_prime 1 // False
//Start = is_prime 2 // True
//Start = is_prime 2017 // True

// ***

// Write a function that takes Int argument and checks if this number is a palindrome.

// Palindrome is a number that is the same when we read from left to right or from right to left.

is_palindrome :: Int -> Bool
is_palindrome n = ds == rds
where
	ds :: [Int]
	ds = [(toInt d) - 48 \\ d <-: toString n]

	rds :: [Int]
	rds = reverse ds
	
//Start = is_palindrome 0 // True
//Start = is_palindrome 55 // True
//Start = is_palindrome 49594 // True
//Start = is_palindrome 1337 // False
//Start = is_palindrome -57975 // False // negative numbers are not palindromes.

// ***

// Write a recursive(!) function for exponentiation, i.e. your function should take two Integer arguments 'x' and 'n' and give back 'x' to the power of 'n' (x*x*x ... *x).  Assume that 'n' is non-negative.

// Note: 'x' to the power 0 is 1.

recpow :: Int Int -> Int
recpow base 0 = 1
recpow base power = do_recpow base power 1
where
	do_recpow :: Int Int Int -> Int
	do_recpow b 1 accum = accum * b
	do_recpow b p accum = do_recpow b (p - 1) (accum * b)

//Start = recpow 2 4
//Start = recpow 2 0 

// ***

/*-1 
    * Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
     Symbol       Value
        I             1
        V             5
        X             10
        L             50
        C             100
        D             500
        M             1000
    
    * Write the function "getValue" which gets a symbol and returns the represented value of that symbol according to the table above.
    * If the given symbol is not in the table above, abort with "Not valid input" 
    * hint:  you can use the abort funciton

    Example for the abort function:
    task: calculate the factorial of a positive number
          if the number is negative, abort with "invalid argument"

          solution:
          fact :: Int -> Int
          fact x
          | x <  0 = abort "invalid argument" // if the value is less than 0 -> abort the program with this message "invalid argument" 
          | x == 1 = 1 
          = x * fact (x - 1)   

          Start = fact 3 // 6 
          Start = fact 4 // 24 
          Start = fact -1 //  invalid argument" 

*/

getValue :: Char -> Int
getValue c
| c == 'I' = 1
| c == 'V' = 5
| c == 'X' = 10
| c == 'L' = 50
| c == 'C' = 100
| c == 'D' = 500
| c == 'M' = 1000
| otherwise = abort "invalid input"

/// Used to test your funciton if it produces the correct answer or not !

// Start = getValue 'I' // 1
// Start = getValue 'V' // 5
// Start = getValue 'X' // 10 
// Start = getValue 'L' // 50
// Start = getValue 'C' // 100
// Start = getValue 'D' // 500 
// Start = getValue 'M' // 1000
// Start = getValue '0' //  "invalid input"

// ***

/*2-  
    Create a function which transforms the number of days to years, weeks and days. 
    For example: 375 days = 1 year 1 week 3 days.
    - 1 year = 365 days (Ignoring leap year)

    Hints:
         * you can use the toString function: the funciton  transforms the given input to String (e.g toString 5  ->  "5")
         * don't forget the paranthesis!
*/

transform :: Int -> String 
transform days = (toString y) +++ " year " +++ (toString w) +++ " week " +++ (toString d) +++ " day" 
where
	y = days / 365
	w = (days - (y * 365)) / 7
	d = (days - (y * 365)) rem 7
	
//Start = transform 375 // "1 year 1 week 3 days"
//Start = transform 365 // "1 year 0 week 0 days"
//Start = transform 1050 // "2 year 45 week 5 days"
//Start = transform 2500 // "6 year 44 week 2 days"

// ***

/*-3
    * The first element of the Collatz series is an arbitrary positive integer. Following elements could be defined recursively:
    * the next element is 3 times the previous element increased by one, if the previous element was odd, otherwise the next
    * element is the half of the previous element.
    * 
    * As an example, starting from 3 as an input, the elements of the Collatz series are
    * 3, 10, 5, 16, 8, 4, 2, 1
    * 
    * According to the Collatz conjecture, this series **always** reaches 1, which is the last element in the previous
    * example, making the length of the Collatz series 8.

    * The function gets the first element of the series as input and should return the length of the Collatz series
*/

len :: Int -> Int
len n 
| n < 1 = abort "Invalid input"
| otherwise = collatz n 1
where
	collatz :: Int Int -> Int
	collatz 1 accum = accum
	collatz n accum
	| isOdd n = collatz ((3 * n) + 1) accum + 1
	| otherwise = collatz (n / 2) accum + 1

//Start = len 3 // 8 
//Start = len 5 // 6   
//Start = len 8 // 4   
//Start = len -8 // "Invalid input"    

// ***

//1. Give a list of numbers, multiplying all even numbers by 2 and all odd numbers by 3

multiply :: [Int] -> [Int]
multiply ns = map do_mul ns
where
	do_mul :: Int -> Int
	do_mul n
	| isEven n = n * 2
	| otherwise = n * 3

//Start = multiply [14, 22, 45, 56] // [28, 44, 135, 112]
//Start = multiply [13, 27, 44] // [39, 81, 88]
//Start = multiply [] // []

// ***

// 2. Given a list of integers, find the prime numbers and compute the sum of them.
// Return 0 for empty lists or if there are no primes.

sum_of_prime :: [Int] -> Int
sum_of_prime ns = sum (filter is_prime ns)

//Start = sum_of_prime [14, 22, 45, 56] // 0
//Start = sum_of_prime [13, 27] // 13
//Start = sum_of_prime [13, 3, 76, 17] // 33
//Start = sum_of_prime [] // 0

// ***

/*
3. Given two lists of integers of the same length, check if the elements in two lists with the same index are of the same property (both even or both odd).
Return True for empty lists
*/

same :: [Int] [Int] -> Bool
same as bs = all is_similar [0..(len - 1)]
where
	len :: Int
	len = length as
	
	is_similar :: Int -> Bool
	is_similar index = both_even || both_odd
	where
		a :: Int
		a = as !! index
		b :: Int
		b = bs !! index
		both_even :: Bool
		both_even = (isEven a) && (isEven b)
		both_odd :: Bool
		both_odd = (isOdd a) && (isOdd b)

//Start = same [1,2,3] [2,4,6] // False
//Start = same [1,2,3,4] [3,8,5,12] // True
//Start = same [] [] // True