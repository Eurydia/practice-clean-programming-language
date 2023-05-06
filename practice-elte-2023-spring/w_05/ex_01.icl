module ex_05

import StdEnv


// 1. generate a list with 10 times of 13 : [13,13,13,13,13,13,13,13,13,13]
l1 :: [Int]
l1 = take 10 (repeat 13)

//Start = l1


// 2. generate the following list [(1,1),(1,2),(2,1),(2,2)]
l2 :: [(Int, Int)]
l2 = [(x, y) \\ x <- [1..2], y <- [1..2]]

//Start = l2


// 3. generate the following list [(1,3),(1,2),(1,1),(2,3),(2,2),(2,1),(3,3),(3,2),(3,1)]
l3 :: [(Int, Int)]
l3 = [(x, y) \\ x <- [1..3], y <- (reverse [1..3])]

//Start = l3


// 4. generate the list [(1,5),(2,6),(3,7),(4,8),(5,9),(6,10)]
l4 :: [(Int, Int)]
l4 = [(x, x + 4) \\ x <- [1..6]]
//Start = l4


// 5. generate the list [1,2,2,3,3,3,4,4,4,4,...,10,..,10]
l5 :: [Int]
l5 = flatten [repeat x x \\ x <- [1..10]]

//Start = l5


// 6. generate the list [[1],[2,2],[3,3,3],[4,4,4,4],...,[10,..,10]]
l6 :: [[Int]]
l6 = [repeat x x \\ x <- [1..10]]

//Start = l62
  
  
// 7. generate 100 pythagoras numbers : [(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20)] a^2 + b^2 = c^2
isPythagorean :: (Int, Int, Int) -> Bool
isPythagorean (a, b, c) = (maxi ^ 2) == ((mini ^ 2) + (medi ^ 2))
where
    mini :: Int
    mini = min (min a b) (min b c)
    medi :: Int
    medi = min (max a b) (max b c)
    maxi :: Int
    maxi = max (max a b) (max b c)

l7 :: [(Int, Int, Int)]
l7 = take 100 (filter isPythagorean [(a, b, c) \\ c <- [1..], b <- [1..c], a <- [1..b]])

//Start = l7


// 8. Generate 100 even numbers using list comprehensions
l8 :: [Int]
l8 = take 100 [x \\ x <- [1..] | x rem 2 == 0]

//Start = l8


// 9. Generate the following list [4, 16, 36, 64, 100, 144, 196, 256, 324, 400]
l9 :: [Int]
l9 = take 20 [x ^ 2 \\ x <- [1..] | x rem 2 == 0]


//Start = l92


// 10. List powers of 2 from 1 to 10.
// hint: use x^y (x at power y)
l10 :: [Int]
l10 = [2^p \\ p <- [1..10]]

//Start = l10


// 11. List the divisors of 90.
l11 :: [Int]
l11 = [div \\ div <- [1..90] | 90 rem div == 0]

//Start = l11


// 12. List �dominoes�: [(0,0),(0,1),(1,1),(0,2),(1,2),(2,2),...,(9,9)]
// Domino (1,0) is not in the list because it is already in it as (0,1).
l12 :: [(Int, Int)]
l12 = [(y, x) \\ x <- [0..9], y <- [0..x]]


//Start = l12


// 13. Construct the list [(1,'a'),(2,'b'),�(�,'z')], i.e. pair up numbers with abc letters.
l13 :: [(Int, Char)]
l13 = [((toInt c) - 48, c) \\ c <- ['a'..'z']]

//Start = l13


// 14. Generate a list of length 10 whose elements are False, True, False, True, � (alternating)
l14 :: [Bool]
//l14 =  [x \\ x <-[False, True] & y <-[1..5]]
//l14 = flatten [x \\ x <- [False, True] , y <-[1..5]]  
//l14 = flatten [x \\ x <-[[False, True]] , y <-[1..5]]  
l14 = [(b rem 2) == 0 \\ b <- [1..10]]

//Start = l14


// 15. Is 123457 a prime number? A nr is prime if only 1 and the numebr divides it.
l15 :: Bool
// l15 = and [123457 rem div <> 0 \\ div <- [2..123456]]
l15 = [1 \\ div <- [2..123456] | 123457 rem div == 0] == []


//Start = l15


// 16. Generate the list [(0,10),(1,9),�,(10,0)].
l16 :: [(Int, Int)]
l16 = [(x, 10 - x) \\ x <- [0..10]]

//Start = l16

// 17. Generate a list that contains all (hour, minute) pairs in a day.
l17 :: [(Int, Int)]
l17 = [(h, m) \\ h <- [0..23], m <- [0..59]]

//Start = l17



// 18.  generate the following list [(1,1),(2,2),(3,3),(4,4),(5,5)]
l18 :: [(Int, Int)]
l18 = [(x, x) \\ x <- [1..5]]

//Start = l18


// 19. generate [(1,2,3),(2,4,6),(3,6,9),(4,8,12),(5,10,15)] 
l19 :: [(Int, Int, Int)]
l19 = [(x, 2 * x, 3 * x) \\ x <- [1..5]]

//Start = l19


// 20. Compute the sum of the list of tuples [(1,1), (2,2), (3,3)] -> (6,6)
//sumtup :: [(Int, Int)] -> (Int, Int)
//sumtup x = (sum a, sum b)
//where (a,b) = unzip x

//Start = sumtup [(1,1), (2,2), (3,3)]


// 21. Generate 5 tuples like [(1,2),(2,3),(3,4),(4,5),(5,6)]
increase :: [(Int, Int)]
increase = [(x, x + 1) \\ x <- [1..5]]


//Start = increase


// 22. Make triple tuples like [(1,2,3),(4,5,6),(7,8,9),(10,11,12),(13,14,15)]
tripl :: [(Int, Int, Int)]
tripl = [((3 * i) - 2, (3 * i) - 1, 3 * i) \\ i <- [1..5]]


//Start = tripl


// 24. Given a list of tuples form a list of triple tuples with the original 
// numbers and their sum
triplesum :: [(Int, Int)] -> [(Int, Int, Int)]
tripleSum ts = [(x, y, x + y) \\ (x, y) <- ts]

//Start = triplesum [(1,2),(2,3),(3,4),(4,5),(5,6)]


// 25. Generate quadruples of a number, its square, its cube, and its biquadratic
// where the number are in the 1..20 interval
quadruple :: [(Int, Int, Int, Int)]
quadruple = [(4 * n, n ^ 2, n ^ 3, n ^ 4) \\ n <- [1..20]]
//Start = quadruple


// 26. Form triple tuples of 3 lists selecting one element from each list.
// E.g. for ([1..10],[20..25],[35..47]) the result is 
// [(1,20,35),(2,21,36),(3,22,37),(4,23,38),(5,24,39),(6,25,40)]
//tri :: ([Int],[Int],[Int]) -> [(Int, Int, Int)]

Start = tri ([1..10],[20..25],[35..47])


// 27. write a function duplicates which checks if there are neighbour duplicates in a list
//duplic :: [Int] -> Bool


//Start = duplic [1, 1] // True
//Start = duplic [2] // False
//Start = duplic [1, 2, 3, 4, 5, 6, 7, 8, 9] // False
//Start = duplic [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] // True
//Start = duplic [1,2,3,4,4] // True


// 28. write a function that removes neighbour duplicates in a list
//duplicrem :: [Int] -> [Int] 


//Start = duplicrem [1,1, 0, 5, 0, 0, 6, 0,0,0, 7, 5, 0, 0, 0, 0, 8, 0, 5, 0, 0, 0] 


// 29. transform the sub-sub lists into one list of sublists
//f :: [[[Int]]] -> [[Int]]


//Start = f [[[1,2,3], [3,4,5]], [[1,2,3], [3,4,5], [7,8,9]]] 
// result : [[1,2,3],[3,4,5],[1,2,3],[3,4,5],[7,8,9]]



// 30. (bonus point) Generate a list that contains all (month, day) pairs in a 365-day 
//l30 :: [(Int, Int)]
//l30 = 

//Start = l30