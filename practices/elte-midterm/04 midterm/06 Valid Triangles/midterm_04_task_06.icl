module midterm_04_task_06

import StdEnv

//// Valid Triangles
/*6.
Given a list of tuples, each with 3 numbers.
For each tuple check if these 3 numbers
can be used as sides of a triangle,
replace the tuple either with True or False.
3 numbers can be sides of triangles if each pair's
sum is greater than the remaining 3rd number.
A number cannot be a side if it is negative or 0.
*/


//validTriangles :: [(Int,Int,Int)] -> [Bool]


//Start = validTriangles [] // []
//Start = validTriangles [(3,3,3), (2,4,5), (4,2,5), (3,3,10)] // [True, True, True, False]
//Start = validTriangles [(8,2,4), (3,10,3), (1,2,3)] // [False, False, False]
//Start = validTriangles [(10,8,3), (-10,4,2)] // [True, False]
