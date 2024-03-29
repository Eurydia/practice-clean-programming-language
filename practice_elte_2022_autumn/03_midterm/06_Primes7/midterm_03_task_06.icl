module midterm_03_task_06

import StdEnv 

/* 6. Primes7

 Given a list of numbers, keep only the prime numbers that end with the digit 7
*/

// ---------------------------------------------------------
// SOLUTION #1
// isLastDigitSeven :: Int -> Bool
// isLastDigitSeven n = (n_digits !! (size - 1)) == '7'
// where
// 	n_digits = [d \\ d <-: (toString n)]
// 	size = length n_digits
	
// isPrime :: Int -> Bool
// isPrime 1 = False
// isPrime 2 = True
// isPrime n = all (\(k) = (n rem k) <> 0) [2..(n - 1)]

// primes7 :: [Int] -> [Int]
// primes7 ns = filter isPrime (filter isLastDigitSeven ns)
// SOLUTION #1 END
// ---------------------------------------------------------

// ---------------------------------------------------------
// SOLUTION #2
isPrime :: Int -> Bool
isPrime    1   =  False
isPrime    n   =  (length [n \\ d <- [2..(n - 1)] | n rem d == 0]) == 0
// isPrime    n   =  [d \\ d <- [1..n] | (n rem d) == 0] == [1, n]

primes7 :: [Int] -> [Int]
primes7    ns    =  [n \\ n <- ns | isPrime n && ((n rem 10) == 7)]
// SOLUTION #2 END
// ---------------------------------------------------------




//Start = primes7 [1..10] // [7]
//Start = primes7 [1..100] // [7,17,37,47,67,97]
Start = primes7 [1..6] // []
