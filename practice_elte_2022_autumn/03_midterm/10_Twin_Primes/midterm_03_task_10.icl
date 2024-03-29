module midterm_03_task_10

import StdEnv 

/* 10. Twin primes
 
 Twin primes is a pair of primes, such that it contains a prime number that is either 
 2 less or 2 more than the pair prime number.
 For example, (41, 43) is a twin prime pair.
 Given a range of numbers left..right write a function that returns the count of 
 twin primes within the range.

 E.g: between 1 and 50 there are 6 pairs of twin prime numbers:
 [(3,5),(5,7),(11,13),(17,19),(29,31),(41,43)].
*/

isPrime :: Int -> Bool
isPrime    0   =  False
isPrime    1   =  False
isPrime    n   =  (length [n \\ d <- [2..(n - 1)] | n rem d == 0]) == 0
// isPrime n = all (\(k) = (n rem k) <> 0) [2..(n - 1)]

twinPrimes :: Int Int -> Int
twinPrimes    s   e   =  length [n \\ n <- (s..(e - 2)) | isPrime n && isPrime (n + 2)]

//Start = twinPrimes 1 50 // 6
//Start = twinPrimes 1 1000 // 35
//Start = twinPrimes 0 2 // 0
Start = twinPrimes 0 -5 // 0

