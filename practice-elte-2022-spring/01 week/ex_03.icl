module ex_03
import StdEnv

// Start = 5

// Start = 5 + 5


// Int, Real, Bool (True, False), String, Char
// Int
// 1,2,3,...
//-1,-2,-3,...
// 0

// Real
// 123.414

// Bool
// True and False

// Start = "some string"


// Start = sqrt 4.0

// Start = sin 30.0


// Bool operators: <, >, <=, >=, <>, &&, ||

// Start = 1 < 2
// Start = False && True

// define some functions
// write a function which find maximum of two numbers
// 10 5 -> 10

maximum_of_two :: Int Int -> Int
maximum_of_two a b
| a > b = a
= b
// | otherwise = b
// if a > b, then result is a
// otherwise result is b
// | a > b

// Start = maximum_of_two -5 -10


// decide if number is odd
// Start = isOdd 11
my_is_odd :: Int -> Bool
my_is_odd a
| a < 0 = my_is_odd (~a)
| a rem 2 == 1 = True
= False

// my_is_odd :: Int -> Bool
// my_is_odd a = (a rem 2 == 1)

// Start = my_is_odd -11


// We get three numbers as parameters
// Decide if third one is equal to sum of other two

my_is_sum :: Int Int Int -> Bool
my_is_sum x y z
| z == x + y = True
= False

// We get three numbers as parameters
// Decide if any of them is sum of other two

// my_is_sum2 :: Int Int Int -> Bool
// my_is_sum2 x y z
// | x == y + z = True
// | y == x + z = True
// | z == x + y = True
// = False

// my_is_sum2 :: Int Int Int -> Bool
// my_is_sum2 x y z
// | (x == y + z) || (y == x + z) || (z == x + y) = True
// = False

// my_is_sum2 :: Int Int Int -> Bool
// my_is_sum2 x y z = (x == y + z) || (y == x + z) || (z == x + y)


// recursion

// Add the numbers from 1 to N

// sum 1..N = (sum 1..N-1) + N


addN :: Int -> Int
addN x
| x == 1 = 1
= addN (x-1) + x


// Start = addN 5 = addN 4 + 5 = addN 3 + 4 +5 = addN 2 + 3 + 4 + 5 = addN 1 + 2 + 3 + 4 + 5 = addN 0 + 1 + 2 + ..
// Start = addN 5 = addN 4 + 5 = addN 3 + 4 +5 = addN 2 + 3 + 4 + 5 = addN 1 + 2 + 3 + 4 + 5 = 1 + 2 + 3 + 4 + 5 = 15


// Start = addN 5
// addN (5-1) + 5 = addN 4 + 5
// addN (4-1) + 4 + 5 = (addN 3) + 4 + 5 = (addN 2) + 3 + 4 + 5 = (addN 1) + 2 + 3 + 4 + 5 = 1 + 2 + 3 + 4 + 5 = 15



// Find factorial of N
// N! = 1 * 2 * 3 ... * N
// 0! = 1

// addN :: Int -> Int
// addN x
// | x == 1 = 1
// = (addN (x-1)) + x

factorialN :: Int -> Int
factorialN x
| x == 0 = 1
= (factorialN (x-1)) * x

Start = factorialN 4
factorialN 4 = (factorialN 3) * 4 = (factorialN 2) * 3 * 4 = (factorialN 1) * 2 * 3 * 4 = (factorialN 0) * 1 * 2 * 3 *4
= 1 * 1 * 2* 3 * 4 = 24

