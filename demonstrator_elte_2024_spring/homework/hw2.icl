module hw2
import StdEnv


// (BEGIN FIXED)
// NEPTUN code: YYYYYY
//
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)".
// The file name should be "hwYY.icl" before submission
// Partially solved tasks are still graded, but your submission must not contain compilation or runtime errors.
//  (END FIXED)


// Task: 1/2
//    Given a list of integers, find the element with the least frequency.
//    If there are multiple, find all of them. 
//    If the list is empty, return an empty list.
// 
// For example:
// - [1, 1, 1, 2] -> [2]
// - [1, 2, 2, 2] -> [1]
// - [1, 2, 3, 3] -> [1, 2]
// - [1, 2, 3]    -> [1, 2, 3]
// - []           -> []


// findMinFrequency :: [Int] -> [Int]


// (BEGIN FIXED)
// Start = findMinFrequency []             // Expected: []
// Start = findMinFrequency [1, 1, 1, 2]   // Expected: [2]
// Start = findMinFrequency [1, 2, 2, 2]   // Expected: [1]
// Start = findMinFrequency [1, 2, 3, 3]   // Expected: [1, 2]
// Start = findMinFrequency [1, 2, 3]      // Expected: [1, 2, 3]
// (END FIXED)


// Task: 2/2
//    Give a list of real numbers, determine the median. For this task, let's assume that the given list is not-empty and valid.
//    The median is the "middle point" of the list. 
//    Half of the real numbers is smaller and the other half is greater than the median.
//    There are multiple ways to find the median, but common one is to:
//        - sort the list
//        - if the list contains odd number of elements, the middle element is the median
//        - if the list contains even number of elements, the average of the middle elements is the median.
//
//     It is not important to follow these steps if you have a more efficient method.
// For example:
// - [0.0, 10.0, 20.0, 40.0, 50.0]  -> 20.0
// - [10.0, 40.0, 20.0, 50.0] -> 30.0
// - [1.0, 2.0, 3.0] -> 2.0
// - [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] -> 0.0
// - [13.0, 21.0, 38.0, 19.0, 30.0, 7.0] -> 20.0


// findMedian :: [Real] -> Real


// (BEGIN FIXED)
// Start = findMedian [0.0, 10.0, 20.0, 40.0, 50.0]       // Expected: 20.0
// Start = findMedian [10.0, 40.0, 20.0, 50.0]            // Expected 30.0
// Start = findMedian [1.0, 2.0, 3.0]                     // Expected 2.0
// Start = findMedian [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] // Expected 0.0
// Start = findMedian [13.0, 21.0, 38.0, 19.0, 30.0, 7.0] // Expected 20.0
// (END FIXED)
