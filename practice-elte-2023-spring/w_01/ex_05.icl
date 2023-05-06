module ex_05

import StdEnv



// factorial :: Int -> Int
// factorial 0  = 1
// factorial n = n * factorial (n-1)


factorial2 :: Int -> Int
factorial2 n = faux n 1

faux :: Int Int -> Int
faux 0 result = result
faux n result = faux (n-1) (result * n)

// Start = factorial2 5 = faux 5 1 = faux 4 5 = faux 3 20 = faux 2 60 = faux 1 120 = faux 0 120 = 120
//


// 0, 1, 1, 2, 3 ..

// fib :: Int -> Int
// fib 0 = 0
// fib 1 = 1
// fib n = fib (n-1) + fib (n-2)


// Start = fib 60


fib :: Int -> Int
fib n = fibAux 1 1 n

fibAux :: Int Int Int -> Int
fibAux a b 0 = a
fibAux a b c = fibAux b (a+b) (c-1)

// Start = fib 60

// fibAux 1 1 5 = fibAux 1 2 4 = fibAux 2 3 3 = fibAux 3 5 2 = fibAux 5 8 1 = fibAux 8 13 0 = 8


// Start = 5 + 2
// Start = (+) 5 2

// Start = 5 * 2 + 2

// (==) infix 4 :: [a] [a] -> Bool | == a
// (==) [] [] = True
// (==) [] [y:ys] = False
// (==) [x:xs] [] = False
// (==) [x:xs] [y:ys] = (x==y) && (xs==ys)

// Start = [1,2,3] == [1,2,3]


// Write a function which calculates the length of the list

length1 :: [a] -> Int
length1 [] = 0
length1 [x:xs] = 1 + length1 xs

// Start = lengt1 [1..100] // 100

// Given a list of lists of integers, calculate the sum of all the elements of that list
//[[1,2,3],[1],[2,2]]=1+2+3+1+2+2=11
// my_sum :: [[Int]] -> Int
// my_sum list = sum (flatten list)
// my_sum [] = 0
// my_sum [x:xs] = sum x + my_sum xs
// Start = my_sum [[1,2,3],[1],[2,2]]

// remove the first 2 and the last 2 elements of a list
// droptake2 :: [a] -> [a]
// droptake2 list = (drop 2 list) ++ take (reverse (reverse (drop 2 list)))
// droptake2 list = take ((length list) - 4) (drop 2 list)
// droptake2 list = drop 2 (take ((length list) - 2) list)
// droptake2  list = init (init (tl (tl list)))

// Start = droptake2 [1, 2, 3, 4, 5, 6, 7, 8, 9]


// Start = [stuff that you want in your list \\ ranges]
// Start = [2^n \\ n <- [1..10]]
// Start = [1,3..100]
// Start = [n \\ n <- [1..100] | isOdd n]

// Start = [1 \\ n <- [1..200]]
// Start = [a+b \\ a <- [1..5] & b <- [6..10]]
// Start = [a+b \\ a <- [1..5] , b <- [6..10]]
// Start = [a + b \\ a<-[-10..10] & b <-[-10..10] | isEven b]

// Generate the list of power of two until 10000

// Start = take 100 [(2^n) \\ n<-[1..] | (2^n) <= 100]

// Write a code which will add 1.0 to every real number from the list which is less than 10
add_one :: [Real] -> [Real]
add_one [] = []
add_one [x:xs]
| x < 10.0 = [x+1.0] ++ add_one xs // [x+1.0: add_one xs]
= [x: add_one xs]

// 1,2,..32
// Generate the pairs

// Start = [(a,b) \\ a <- [1..32] , b<-[1..32] | (a <> b) && isEven (a+b)]



//Given a list of integers.
//Write a code which will substitute every integer greater than 5 with the character 'g'
// and every integer less or equal to 5 with 's'

// change :: [Int] -> [Char]
// change [] = []
// change [x:xs]
// | x > 5 = ['g'] ++ change xs
// = ['s'] ++ change xs

// Start = change [1..10]

//Given a list of Booleans.
//Write a code which will substitute every True value with 1 and every False value with 0

change :: [Bool] -> [Int]
change [] = []
change [x:xs]
| x = [1] ++ change xs
= [0] ++ change xs

Start = change [False,True,False,False,True,False,True,True,False,False,False,True,True,True]