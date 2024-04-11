module hw4
import StdEnv

// (BEGIN FIXED)
// NEPTUN code: yyyyyy
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)" but feel free to add or remove everything else.
// Only ".icl" file format will marked and the file name should be "hw4.icl".
// Please comment out all "Start" and ensure that there is no compilation error or runtime error before submission.
// Partial solutions will marked, but only if it does not contain error.
// (END FIXED)

// Task 1/2
// Given a list of lower case English alphabet and an integer "n", write a function which returns a list of 2-tuples. The first component of each tuple is a character in the list, and the second component is the character shifted by "n" positions.
// Example:
//    Input:  ['c'] 2
//    Output: [('c', 'e')]
// Example:
//    Input:  ['z'] 1
//    Output: [('z', 'a')]
//    Explanation: If shifting forward would go above 'z', the shifted letter should wrap to 'a'.
// Example:
//    Input:  ['a'] -1
//    Output: [('a', 'z')]
//    Explanation: If shifting backward would go below 'a', the shifted letter should wrap to 'z'.

shiftBy :: Int Char -> Char
shiftBy    pos ch
| shiftedCh > 'z'  	= shiftedCh - (toChar 26)
| shiftedCh < 'a'  	= shiftedCh + (toChar 26)
| otherwise         = shiftedCh
where 
  shiftedCh :: Char
  shiftedCh =  (toChar (pos rem 26)) + ch

// (BEGIN FIXED)
shiftChar :: Int [Char] -> [(Char, Char)]
shiftChar    pos ls     => [(ch, shiftBy pos ch) \\ ch <- ls]
// (END FIXED)

// (BEGIN FIXED)
//Start = shiftChar  0 ['a', 'z'] // [('a','a'), ('z',  'z')]
//Start = shiftChar  5 ['a'..'c'] // [('a','f'),('b','g'),('c','h')]
//Start = shiftChar -5 ['a'..'c'] // [('a','v'),('b','w'),('c','x')]
//Start = shiftChar  5 ['x'..'z'] // [('x','c'),('y','d'),('z','e')]
//Start = shiftChar -5 ['x'..'z'] // [('x','s'),('y','t'),('z','u')]
// (END FIXED)

// Task 2/2
// Given two natural numbers "X, N", write a function that collects "N" prime numbers which are strictly greater than "X".
// Example:
//    Input: X=2, N=3
//    Output: [3, 5, 7]
//    Explanation: The next three prime numbers which strictly greater than 2 are 3, 5, and 7.
// Example:
//    Input: X=4, N=4
//    Output: [5, 7, 11, 13]
// Example:
//    Input: X=0, N=5
//    Output: [2, 3, 5, 7, 11]
// Example:
//    Input: 11 0
//    Output: []

isPrime :: Int -> Bool
isPrime    x   =  (length [1 \\ d <- [1..x] |( x rem d) == 0]) == 2

// (BEGIN FIXED)
nextNPrimes :: Int Int -> [Int]
nextNPrimes    s   n   =  take n [x \\ x <- [(s+1)..] | isPrime x]
// (END FIXED)

// (BEGIN FIXED)
//Start = nextNPrimes 2 3    // [3, 5, 7]
//Start = nextNPrimes 4 4    // [5, 7, 11, 13]
//Start = nextNPrimes 0 5    // [2, 3, 5 ,7, 11]
//Start = nextNPrimes 11 0   // []
Start = nextNPrimes 1001 3 // [1009,1013,1019]
// (END FIXED)