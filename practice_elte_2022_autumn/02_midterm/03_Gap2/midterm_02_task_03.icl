module midterm_02_task_03

import StdEnv 

/* 3. Gap2
 
 Given a list of numbers, convert the list in such a way that 
 the difference between two consecutive elements is always 2,
 you may have to add numbers in order to achieve that.
 e.g: [1,5,8] = [1,3,5,7,9]
*/

gap2 :: [Int] -> [Int]
gap2 n_list = [list_min,(list_min + 2)..list_max]
where
	list_min = minList n_list
	list_max = (maxList n_list) + (((maxList n_list) + 1) rem 2)

//Start = gap2 [1,5,8] // [1,3,5,7,9]
//Start = gap2 [1,5,15] // [1,3,5,7,9,11,13,15]
Start = gap2 [] 
