module mock_exam_01

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
parasitic x n = (x * n) == (ld * (10 ^ (digits - 1)) + (x / 10))
where
	digits :: Int
	digits = size (toString x)
	
	ld :: Int
	ld = x rem 10

//Start = parasitic 102564 4 // True
//Start = parasitic 142857 5 // True
//Start = parasitic 714285 8 // False
//Start = parasitic 105263157894736842 2 // True



/* 2. Double Ones

 Given a list of integers, write a function which will keep only the numbers
 that contain at least two '1' digits. For example:
 [1,2,21,121,11,234131,111111,123,0,334] -> [121,11,234131,111111]
*/

doubleOne :: [Int] -> [Int]
doubleOne ns = filter isGood ns
where
	isGood :: Int -> Bool
	isGood n = (length [c \\ c <-: (toString n) | c == '1']) > 1

//Start = doubleOne [1,2,21,121,11,234131,111111,123,0,334] // [121,11,234131,111111]
//Start = doubleOne [12,1,11,33] // [11]
//Start = doubleOne [11,111,21] // [11,111]
//Start = doubleOne [] // []
//Start = doubleOne [21,3,1] // []



/* 3. Multiples

 Given an n>0 integer value, write a function that creates the double, the triple
 and so on n-th multiple of the number.
*/

multiple :: Int -> [Int]
multiple n = [n * m \\ m <- [2..n]]

//Start = multiple 5 // [10,15,20,25]
//Start = multiple 2 // [4]
//Start = multiple 1 // []



/* 4. List difference
 
 Given two lists (A and B) containing sublists of integer numbers, 
 both A and B are of the same length,
 for every sublist in A and B, return the difference of the two sublists.  

 The difference is defined as follows:  
 The List L1-L2 consists of elements that are in L1 but not in L2. 
 For example if L1=[1,2,3] and L2=[3,5], then L1-L2=[1,2].
*/


difference :: [[Int]] [[Int]] -> [[Int]]
difference x y = [removeMembers (x !! i) (y !! i) \\ i <- [0..(l - 1)]] 
where
	l :: Int
	l = length x
	
[(x, y) \\ x <- [1..3] & y <- [2..3]]

//Start = difference [[1..5]] [[4..7]] // [[1,2,3]]
//Start = difference [[1..10] , [10..15] , [1..4]] [[1..10] , [11..20] , [5]] // [[],[10],[1,2,3,4]]
//Start = difference [] [] // [] 


 
/*5. GoodNumbers
   Write a function that takes a list as an argument and counts how many numbers are:
   greater or equal to 10 AND less or equal to 99 AND divisible by 3.
*/

countGoodNums :: [Int] -> Int
countGoodNums ns = length (filter isGood ns)
where
	isGood :: Int -> Bool
	isGood n = n >= 10 && n <= 99 && n rem 3 == 0

//Start = countGoodNums [1,12,10,99] // 2
//Start = countGoodNums [12,15,30,33,39,96,99] // 7
//Start = countGoodNums [9, 10, 100, 102, 105] // 0
//Start = countGoodNums [] // 0


/* 6. Primes7

 Given a list of numbers, keep only the prime numbers that end with the digit 7
*/

primes7 :: [Int] -> [Int]
primes7 ns = filter isGood ns
where
	isGood :: Int -> Bool
	isGood n = n rem 10 == 7 && isPrime n
	
	isPrime :: Int -> Bool
	isPrime 0 = False
	isPrime 1 = False
	isPrime n = [d \\ d <- [2..(n - 1)] | n rem d == 0] == []

//Start = primes7 [1..10] // [7]
//Start = primes7 [1..100] // [7,17,37,47,67,97]
//Start = primes7 [1..6] // []



/* 7. Property check

 Given a list of tuples, write a function to determine
 whether all of the tuples inside of the list hold the (Even, Odd) property.
 [(2,1),(2,3),(4,1)] = True
*/	


holdsTrue :: [(Int, Int)] -> Bool
holdsTrue [] = False
holdsTrue ts = and [isEven x && isOdd y \\ (x, y) <- ts]

//Start = holdsTrue [(2,1),(2,3),(4,1)] // True
//Start = holdsTrue [(1,3),(2,3),(3,4)] // False
//Start = holdsTrue [] // False



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
	n_digits = [(toInt d) - 48 \\ d <-: (toString n)]
	size = length n_digits

super_digit :: [Int] -> [Int]
super_digit ns = map getSuper ns

//Start = super_digit [148148148 , 9875 ] // [3,2]
//Start = super_digit [884555 , 456 , 2351 , 21587 , 88 ] // [8,6,2,5,7]
//Start = super_digit [] // [] 



/* 9. Powers 
 Given a list of integers and an integer, write a function which returns a list 
 which only contains the powers of the integer.
*/


isPowerOf :: Int Int -> Bool
isPowerOf n k = checkPower zero
where
	checkPower :: Int -> Bool
	checkPower p
	| n ^ p < k = checkPower (p + 1)
	| n ^ p > k = False
	| otherwise = True

powersList :: [Int] Int -> [Int]
powersList ns k = filter (isPowerOf k) ns

//Start = powersList [2,4,8,16,32,33,55] 2 // [2,4,8,16,32]
//Start = powersList [] 3 // []
//Start = powersList [1..10] 3 // [1,3,9]
//Start = powersList [-1,-2,4,8] 4 // [4]



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
isPrime 0 = False
isPrime 1 = False
isPrime n = [1 \\ d <- [2..(n - 1)] | n rem d == 0] == []

twinPrimes :: Int Int -> Int
twinPrimes start end = length (filter isGood [start..(end - 2)])
where
	isGood :: Int -> Bool
	isGood n = isPrime n && isPrime (n + 2)

//Start = twinPrimes 1 50 // 6
//Start = twinPrimes 1 1000 // 35
//Start = twinPrimes 0 2 // 0
//Start = twinPrimes 0 -5 // 0

x :: int
(toDigits x) :: [Int]
(countOnes (toDigits x)) :: Int

removeMembers X Y
[1,2,3] [2]
[1,3]

removeMembers x y \\x <- list1 & y <- list2
([1,2,3], [4,5,6])


