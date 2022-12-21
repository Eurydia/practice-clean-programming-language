module midterm_01_task_08

import StdEnv

/* 8. Good Lists
 Given the list of lists and a list of unique numbers. 
 Numbers that are given in this second unique number list are considered to be good numbers. 
 A List is considered good if at least half of its numbers are good. Count how many good lists 
 are in the given list of lists.

 Ex. If you are given [[1,2,3], [1,3,3,4,9,6], [3..6]]  and [1,2,3], good numbers are 1, 2 and 3. 
 First list [1,2,3] has 3 good numbers out of total 3 numbers, hence it is good. 
 Next one [1,3,3,4,9,6] has 3 good numbers (1,3,3) which is half of total length, hence it is a good one as well.
 Last list [3..6] has only one good number and is not a good list. Therefore, answer for this example is 2.
*/

//goodLists :: [[Int]] [Int] -> Int

Start = 1

// Start = goodLists [[1,2,3], [1..6], [3..6]] [1,2,3] // 2
// Start = goodLists [[1], [1..6], [3,8,5]] [1,2,3,8] // 3
// Start = goodLists [[], [3,2,5], [1,1,2,2]] [1] // 2
// Start = goodLists [] [1,2,3] // 0