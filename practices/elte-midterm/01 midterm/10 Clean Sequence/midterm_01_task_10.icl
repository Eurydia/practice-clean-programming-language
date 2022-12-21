module midterm_01_task_10

import StdEnv

/* 10. Clean Sequence
 The Clean sequence is defined in following way:
 s(0) = a
 s(1) = b
 s(2) = c
 and for every k greater than 2:
 s(k) = ( s(k-1)*s(k-2) + s(k-3) ) rem 1000
 
 Given n, a, b and c - generate first n numbers from Clean sequence.
*/



//clean :: Int Int Int Int -> [Int] 

// Start = clean 5 1 2 3 // [1,2,3,5,11]
// Start = clean 11 123 79 3 // [123,79,3,720,957,117,157,126,495,277,647]
// Start = clean 2 1 2 3 // [1,2]
// Start = clean 1 1 2 3 // [1]

Start = 1

