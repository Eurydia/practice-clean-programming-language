module midterm_02_task_08

import StdEnv 


/* 8. Good Lists

 Given a list of lists, count how many of the sublists are good lists.
 A list is good if it is empty or its 1st number is odd, 2nd is even, 
 3rd is odd, 4th is even and so on.
 E.g: [[],[1,2,3,4],[8,3,4],[9],[3,4,4]] your function should return
 3 as only [], [1,2,3,4] and [9] are "good".
*/

//isGood :: Int [Int] -> Int

// Start = isGood [[],[1,2,3,4],[8,3,4],[9],[3,4,4]] // 3
// Start = isGood [[1,2,3,4],[3,4,4],[3,42],[12,2,1,2]] // 2
// Start = isGood [[],[1,2,3,4],[],[8,3,4],[1],[2],[9],[3,4,4]] // 5
// Start = isGood [] // 0

