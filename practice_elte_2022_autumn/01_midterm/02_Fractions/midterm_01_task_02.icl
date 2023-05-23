module midterm_01_task_02

import StdEnv

/* 2. Fractions
 
 Given a list of real numbers, keep only the fraction part of the number
*/
floor :: Real -> Int
floor r = find_floor r zero
where 
	find_floor :: Real Int -> Int
	find_floor r f
	| (toReal f) > r = f - 1
	| otherwise = find_floor r (f + 1)

fraction :: [Real] -> [Real]
fraction list = map remove_int list
where 
	remove_int :: Real -> Real
	remove_int r = r - (toReal (floor r))

Start = fraction [1.2,1.5,0.6] //[0.2,0.5,0.6]
//Start = fraction [1.25, 8.2115548896, 53.21,45.58,0.005] //[0.25,0.2115548896,0.21,0.58,0.00005]
//Start = fraction [] // []