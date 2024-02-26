module hw_week_03
import StdEnv


// (BEGIN FIXED)
// NEPTUN code: yyyyyy
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)" but feel free to add or remove everything else.
// (END FIXED)

// Task: 1/2
// Implement a function to convert an octal string to its decimal representation.
// For context, an octal representation of a number consists eight digits (0-7). To convert an octal representation to a decimal representation, consider the following examples:
// "5" in octal:
// (5 * 1) = 5
// "700" in octal:
// (7 * 64) + (0 * 8) + (0 * 1) = 448
// "42" in octal:
// (4 * 8) + (2 * 1) = 34
// "0" in octal:
// (0 * 1) = 0
// Let's assume that input string is valid, and the output should be a non-negative.

// fromOctToDec :: String -> Int

// (BEGIN FIXED)
// Start = fromOctToDec "5"   // Expected: 5
// Start = fromOctToDec "700" // Expected: 448
// Start = fromOctToDec "42"  // Expected: 34
// Start = fromOctToDec "0"   // Expected: 0
// (END FIXED)

// Task: 2/2
// Implement a function which takes an event natural number (n > 2), and returns two prime numbers whose sum is equal to the given number. 
// CONTEXT:
// Goldbach's conjecture states that every even natural number greater than two can be represented as the sum of two prime number.
// For example:
// 6   = 3  + 3
// 28  = 11 + 17
// 34  = 11 + 23
// 448 = 89 + 359
// The conjecture does not explicitly state that the prime numbers are unique, so any valid pair of prime numbers is accepted.
// For all intents and purposes, let's also assume that every input is valid, so input validation is not needed.

// Feel free to implement your own prime validation function :D
isPrime :: Int -> Bool
isPrime    0   => False
isPrime    1   => False
isPrime    n   => and [(n rem d) <> 0 \\ d <- [2..(n-1)]]

// goldbach :: Int -> [Int]

// (BEGIN FIXED)
// Start = goldbach 6   // Expected: [3, 3]
// Start = goldbach 28  // Expected: [11, 17] OR [17, 11] OR any other valid solution
// Start = goldbach 34  // Expected: [11, 23] OR [11, 23]
// Start = goldbach 448 // Expected: [89, 359] OR [359, 89]
// (END FIXED)