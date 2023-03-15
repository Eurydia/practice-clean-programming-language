module ex_04
import StdEnv

// Write a recursive(!) function for exponentiation,
// i.e. your function should take two Integer arguments 'x' and 'n' and give back 'x' to the power of 'n' (x*x*x ... *x).
// Assume that 'n' is non-negative.

// Note: 'x' to the power 0 is 1.

// x^n = x * x^(n-1)

// exp :: Int Int -> Int
// exp x n
// | n == 0 = 1
// = x * exp x (n-1)

// Start = exp 2 2


// exp :: Int Int -> Int
// exp x 0 = 1
// exp x n = exp x (n-1)


f1 :: Int -> Int
f1 x = x + 1

f2 :: Int -> Int
f2 x = x + 2

f3 :: Int -> Int
f3 x = x + 3

// Lists
// list1 :: [Int]
// list1 = [1,2,3,4]

// list2 :: [Bool]
// list2 = [True, False, False]

// list3 :: [Int -> Int]
// list3 = [f1, f2, f3]

// list4 :: [[Int]]
// list4 = [ [1,2,3], [2,3,41], [22424], [], [2313141] ]

// list5 :: [a]
// list5 = [1,2,3]
// list5 = [True, False, True]


// f :: [Int] -> Int
// f [] = 0
// f [x:xs] = x + f xs

// f :: [Real] -> Real
// f [] = 0
// f [x:xs] = x + f xs

// Start = [1,2,3,4]

// Start = [1, 2, 3, 4, 5 ,6 ,7, 8, 9, 10]
// Start = [1..1000]
// Start = [1,3..1000]
// Start = [2,4..1000]

// Start = [1, 0 .. -10]

// Start = [1,3..]
// Start = [-1,-2..]
// Start = [1.0 .. 2.1]


// Start = ['a','c'..'z']

// Start = hd [1,2,3,43]
// Start = tl [1,2,3,4,5]
// Start = drop 1 [1,2,3,4,5,6]
// Start = drop 1 []
// Start = take 3 [1,2,3,4,5]
// Start = [1,2,3] ++ [4,5,6]
// Start = reverse [1,2,43,5]
// Start = length [1..1900]
// Start = init [1,2,3,45,5]

// Drop the last element of the list
// drop_last :: [Int] -> [Int]
// drop_last list
// | list == [] = []
// = reverse (tl (reverse list))


// Start = drop_last [1,2,3,45,5] // [1,2,3,45]
// // [5,45,3,2,1]
// // [45,3,2,1]
// // [1,2,3,45]


// Start = last [1,2,3,4]
// Start = isMember 300 [1..1301]
// Start = flatten [[1,2,3,4], [13], [1324], [], [1213141423,314141]]

// Start = drop 5 [1,2,3]

// Start = [12,31,41,51]!!2
// Start = drop (1+1) [1,2,3,4]
// Start = isMember ([1..5]!!1) [1..5]


// pattern matching
// [x,y,z] = x + y + z

// triplesum :: [Int] -> Int
// triplesum list
// | list == [] = 0
// | length list == 1 = list!!0
// | length list == 2 = list!!0 + list!!1
// | length list == 3 = list!!0 + list!!1 + list!!2


triplesum :: [Int] -> Int
triplesum [] = 0
triplesum [x] = x
triplesum [x, y] = x+y
triplesum [x, y, z] = x+y+z

// Start = triplesum [1,2,1,4]

// hd
head :: [Int] -> Int
head [x:xs] = x // x is head, xs is tail

// Start = [1: [2: [3: [4: []] ] ] ]  // [1,2,3,4]

// sum of first two elements

sum_of_two :: [Int] -> Int
sum_of_two [] = 0
sum_of_two [x] = x
sum_of_two [x,y] = x+y
sum_of_two [x,y:xs] = x+y


// lastof
lastof :: [a] -> a
lastof [x] = x
lastof [x:xs] = lastof xs

// Start = lastof [1,2,3,4,5] = 5
// lastof [2,3,4,5] = lastof [3,4,5] = lastof [4,5] = lastof [5] = 5


// 1. Evaluate the following expressions:

// Start = (take 3 [1..10]) ++ (drop 3 [1..10]) // = [1..10]

// Start = length (flatten [[1,2], [3], [4, 5, 6, 7], [8, 9]])

// Start = isMember (length [1..5]) [7..10]

// Start = [1..5] ++ [0] ++ reverse [1..5] // [1,2,3,4,5,0,5,4,3,2,1]

// [1,2,3,4,5] []
// [1,2,3,4] [5]
// [1,2,3] [5,4]
// [1,2] [5,4,3]
// [1] [5,4,3,2]
// [] [5,4,3,2,1]


// my_reverse :: [a] -> [a]
// my_reverse list = my_reverse_aux list []

// my_reverse_aux :: [a] [a] -> [a]
// my_reverse_aux [] result = result
// my_reverse_aux list result = my_reverse_aux (init list) (result ++ [last list])


// reverse :: [a] -> [a]
// reverse [] = []
// reverse [x:xs] = reverse xs ++ [x]

// Start = reverse [1,2,3,4] = reverse [2,3,4] ++ [1] = reverse[3,4] ++ [2] ++ [1]
// = reverse [4: []] ++ [3] ++ [2] ++ [1] = reverse [] ++ [4] ++ [3] ++ [2] ++ [1]
// = [] ++ [4] ++ [3] ++ [2] ++ [1] = [4,3,2,1]


// 2. Generate lists
// from -10 to 10
// Start = [-10..10]
// every 10th element from 0 to 100
// Start = [0,10..100]

// 3. Operations with lists: write functions for the followings
// keep the head of every sublist e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [1, 3, 5]


// [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [1, 3, 5]

// [[1,2,3]] -> [1]


heads :: [[Int]] -> [Int]
heads [] = []
heads [x] = [hd x]
heads [x:xs] = [hd x] ++ heads xs

// Start = heads [[1, 2, 3], [3, 4], [5, 7, 8, 9]] = [1] ++ heads [[3, 4], [5, 7, 8, 9]]
// = [1] ++ [3] ++ heads [[5, 7, 8, 9]] = [1] ++ [3] ++ [5] = [1,3,5]
