module pt_02

import StdEnv

/*
Write a function that returns the length of the longest sublist in a list of lists.
Hint: you may want to use maxList built-in function.
*/

longest_length :: [[Int]] -> Int
longest_length nss = maxList (map length nss)


//Start = longest_length [[1, 2, 3], [4, 5], [6, 7, 8, 9]] // 4
//Start = longest_length [[10, 20], [30, 40, 50, 60], [70, 80, 90, 100, 110]] // 5
//Start = longest_length [[], [], [], []] // 0
//Start = longest_length [[1, 2], [], [3, 4, 5, 6], [7, 8], [9, 10, 11, 12, 13, 14, 15, 16, 17]] // 9
//Start = longest_length [[1], [2], [3], [4]] // 1
//Start = longest_length [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12], [13, 14, 15], [16, 17, 18], [19, 20, 21], [22, 23, 24], [25, 26, 27]] // 3