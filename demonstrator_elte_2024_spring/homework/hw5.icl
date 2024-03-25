module hw5
import StdEnv

// (BEGIN FIXED)
// NEPTUN code: yyyyyy
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)" but feel free to add or remove everything else.
// Only ".icl" file format will marked and the file name should be "hw5.icl".
// Please comment out all "Start" and ensure that there is no compilation error or runtime error before submission.
// Partial solutions will marked, but only if it does not contain error.
// (END FIXED)

// Task 1/2
// Given an integer n (n > 0) and a list of integers, implement a function which drops every n-th element from the list.
// Example:
//    Input:  2 [1, 2, 3, 4, 5]
//    Output: [1, 3, 5]
//    Explanation: Dropping every other element from the list.
// Example:
//    Input:  3 []
//    Output: []
//    Explanation: No element to be dropped.
// Example: 
//    Input:  1 [1, 2, 3]
//    Output: []
//    Explanation: Dropping every element from the list.
// Example:
//    Input:  6 [1, 2, 3] 
//    Output: [1, 2, 3]

// (BEGIN FIXED)
//dropEvery :: Int [Int] -> [Int]
// (END FIXED)

// (BEGIN FIXED)
//Start = dropEvery 1  [1,3..20] 	// Expected: []
//Start = dropEvery 2  [10,17..50] 	// Expected: [10,24,38]
//Start = dropEvery 4  [1,3..17] 	// Expected: [1,3,5,9,11,13,17]
//Start = dropEvery 6  [9,7..0] 	// Expected: [9,7,5,3,1]
//Start = dropEvery 20 [9,7..0] 	// Expected: [9,7,5,3,1]
//Start = dropEvery 2  [] 		 	// Expected: []
// (END FIXED)

// Task 2/2
// Given two lists of integers, implement a function which computes their symmetric difference of the lists.
// Recall that the symmetric differnce contains those elements which are not members of both lists.
// Example:
//    Input: [1..10] [2..5]
//    Output: [1,6,7,8,9,10]
// Example:
//    Input: [1..10] []
//    Output: [1,2,3,4,5,6,7,8,9,10]
// Example:
//    Input: [] [2..5]
//    Output: [2,3,4,5]
// Example:
//    Input: [2..5] [1..10]
//    Output: [1,6,7,8,9,10]

// (BEGIN FIXED)
//symmetricDiff :: [Int] [Int] -> [Int]
// (END FIXED)

// (BEGIN FIXED)
//Start = symmetricDiff [1..3] [2..4]    // Expected: [1,4]
//Start = symmetricDiff [] [2..4]    // Expected: [2,3,4]
//Start = symmetricDiff [1..3] [] // Expected: [1,2,3]
//Start = symmetricDiff [] [] // Expexted: []
//Start = symmetricDiff [1,3..10] [9,7..0] // []
// (END FIXED)