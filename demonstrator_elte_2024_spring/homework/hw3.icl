module hw3
import StdEnv


// (BEGIN FIXED)
// NEPTUN code: yyyyyy
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)" but feel free to add or remove everything else.
// Only ".icl" file format will marked.
// Please comment out all "Start" and ensure that there is no compilation error or runtime error before submission.
// Partial solutions will marked, but only if it does not contain error. 
// (END FIXED)

// Task: 1/2
// Given a list containing lists of integers, implement a function that removes all sublist which has more odd numbers than even numbers.
// Hint: Use the built-in function called "filter"
//      Example: [[1], [0]]
//      Expected: [[0]]
//      The sublist "[1]" is removed since it contains one odd number and zero even number
//      Example: [[1,0], [0,1]]
//      Expected: [[1,0], [0,1]]
//      Neither sublists are removed since they contain equal number of odd and even numbers.

isOddSublist :: [Int] -> Bool
isOddSublist    ls    =  (length (filter isEven ls)) >= (length (filter isOdd ls))

removeOddSublist :: [[Int]] -> [[Int]]
removeOddSublist    lls     =  filter isOddSublist lls

// (BEGIN FIXED)
//Start = removeOddSublist []                     				// Expected: []
//Start = removeOddSublist [[1]]                   				// Expected: []
//Start = removeOddSublist [[1], [0]]              				// Expected: [[0]]
//Start = removeOddSublist [[1,0], [0,1]]          				// Expected: [[1,0], [0,1]]
//Start = removeOddSublist [[1,0,0], [0,1,1], [0,0,0], [1,1,1]] // Expected: [[1,0,0], [0,0,0]]
// (END FIXED)

// Task: 2/2
// Given two positive integers n,k find "Disarium numbers" which are inclusively between n and k.
// A Disarium number is an integer where the sum of each digit raised to the power of its position in the number, is equal to the number. 
// For example:
// 135 is a Disarium number: (1^1) + (3^2) + (5^3) -> 1 + 9 + 125 -> 135
// 175 is a Disarium number: (1^1) + (7^2) + (5^3) -> 1 + 49 + 125 -> 175
// 11 is NOT a Disarium number: (1^1) + (1^2) -> 1 + 1 -> 2

toDigits :: Int -> [Int]
toDigits    n   =  [digitToInt chDigit \\ chDigit <-: (toString n)]

isDisarium :: Int -> Bool
isDisarium    n   =  (sum [d^p \\ d <- (toDigits n) & p <- [1..]]) == n

listDisariumBetween :: Int Int -> [Int]
listDisariumBetween    x   y   =  [n \\ n <- [x..y] | isDisarium n]

// (BEGIN FIXED)
//Start = listDisariumBetween 5 10       // Expected: [5,6,7,8,9]
//Start = listDisariumBetween 10 100     // Expected: [89]
//Start = listDisariumBetween 150 1000   // Expected: [175,518,598]
//Start = listDisariumBetween 1000 1500  // Expected: [1306]
Start = listDisariumBetween 1500 10000 // Expected: [1676,2427]
// (END FIXED)
