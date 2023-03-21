module ex_04

import StdEnv

// TODO: The content of this file is to be added
// when the instructor has uploaded the practice file

// 7. insert zero in the middle of each sublist
f7 :: [[Int]] -> [[Int]]
f7 xss = map insertZero xss
where
    insertZero :: [Int] -> [Int]
    insertZero xs = left ++ [0] ++ right 
    where
        l :: Int
        l = length xs
        left :: [Int]
        left = xs % (0, ((l / 2) - 1))
        right :: [Int]
        right = xs % ((l / 2), l)
        
//Start = f7 [[1..5], [1..6]]

// 8. extract elements smaller than the head of the list
f8 :: [Int] -> [Int]
f8 [] = []
f8 [_:[]] = []
f8 [h:xs] = filter lessThanHead xs
where
	lessThanHead :: Int -> Bool
	lessThanHead x = x < h
	
Start = f8 ([2] ++ [9,8..0])

// 9. Eliminate a list in the sublist
// that are longer than or equal to 10
f9 :: [[Int]] -> [[Int]]
f9 xss = filter isShorterThanTen xss
where
	isShorterThanTen :: [Int] -> Bool
	isShorterThanTen xs = (length xs) < 10
