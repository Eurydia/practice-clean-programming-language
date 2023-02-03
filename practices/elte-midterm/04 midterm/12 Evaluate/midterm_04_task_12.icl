module midterm_04_task_12

import StdEnv

//// Evaluate
/*12.
Given a list of integer numbers representing coefficients of a polynomial,
the polynomial coefficients are given in increasing order of power.
Implement a function which evaluates the polynomial
according to a given value (substituting the given value into it).
You can assume that the given list is not empty.
Example:
List: [2,3,-5,1], the polynomial is 2x^0 + 3x^1 - 5x^2 + 1x^3.
Given value is 1: 2 + (3 * 1) + (-5 * 1^2) + (1 * 1^3) = 1.
*/

substitute :: Int Int Int -> Int
substitute x coeff power = coeff * (x ^ power)

evaluate :: [Int] Int -> Int
evaluate ns x = sum (map (\(power) = substitute x (ns !! power) power) [0..((length ns) - 1)])

//Start = evaluate [2,3,-5,1] 1 // 1
//Start = evaluate [1,-5,2,-8] -2 // 83
Start = evaluate [1,1,1,1,1,1,1,1] 1 // 8