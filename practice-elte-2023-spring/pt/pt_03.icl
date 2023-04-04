module pt_03

import StdEnv

// NEPTUN CODE: B9XP3X

// write a function that takes a list and modifies it by inserting the
// sum of the first and last element of the list in the middle of the list.

// If there's only one element in the list, the function should return the list as it is.

 

// example: [1,2,3,4] -> [1,2,5,3,4]
// explanation: first and last elements of the list are 1 and 4.
// sum of 1 and 4 is 5.
// 5 is inserted in the middle of the list.
 

insInMidSum :: [Int] -> [Int]
insInMidSum [] = []
insInMidSum [a] = [a]
insInMidSum ns = (take size ns) ++ [sum] ++ (drop size ns)
where
	sum :: Int
	sum = (hd ns) + (last ns)

	size :: Int
	size = (length ns) / 2 

//Start = insInMidSum [1,2,3,4]//[1,2,5,3,4]
// Start = insInMidSum [1]//[1]
//Start = insInMidSum [1,5,3,2,8]//[1,5,9,3,2,8]