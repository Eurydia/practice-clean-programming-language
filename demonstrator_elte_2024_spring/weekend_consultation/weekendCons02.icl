module weekendCons02

import StdEnv


// 1. Keep the first and the last digit of a number, assume is positive.
//twoDigits :: Int -> Int
 
//Start = twoDigits 54213 // 53
//Start = twoDigits 3 // " the number  is too small"
//Start = twoDigits 45 // 45
//Start = twoDigits 100 // 10



// 2. Write a function that takes two arguments, say a and b that represent
// the sides of a rectangle, compute the sum of the area and the perimeter.
//pr  :: Int Int -> Int

//Start = pr 10 2 // 44



// 3. Compute the product of even numbers from 20..N in a recursive function, where N is positive.
//fn :: Int -> Int
//fn n

//Start = fn -10 //  N can not be zero or negative or less then 11
//Start = fn 24 // 10560
//Start = fn 21 // 20
//Start = fn 25 // 10560



// 4. Given n people. How many ways are to come first, second and third 
// in a competition?
// hint: https://www.mathsisfun.com/numbers/factorial.html
//fact :: Int -> Int

//Start = fact 7 // 210



// 5. Return  2*1 + ... + n*(n-1) - with a pattern for 0
//sums :: Int -> Int

//Start = sums 5 // 40
// 5*4 + 4*3 + 3*2 + 2*1 + 1*0 + 0
  


// 6. Generate the first n elements of the geometric sequence of factor 2
// and compute their sum.
// hint: https://www.mathsisfun.com/algebra/sequences-sums-geometric.html
//faux :: Int Int -> [Int]

//Start = faux 5 1

//f :: Int -> Int

//Start = f 5 // 31



// 7. Compute the sum 1^0 + 2^1 + 3^2 + ... + n^(n-1) 
// where n is a positive number.
//sump :: Int -> Int

//Start = sump 5 // 702
//Start = sump 3 // 13



// 8. Cut a list in n equal parts, 
// if the list is shorter, return the list as the only or last sublist.
// E.g. cut [1..10] 5 -> [[1,2],[3,4],[5,6],[7,8],[9,10]]
//      cut [1..11] 5 -> [[1,2],[3,4],[5,6],[7,8],[9,10],[11]]

cutHelper [Int] Int         -> [[Int]]
cutHelper ls    sublistSize => [take sublistSize ls : (cutHelper (drop sublistSize ls))]

cut :: [Int] Int  -> [[Int]]
cut    ls    size => cutHelper ls ((length ls) / size)

//Start = cut [1..10] 5 // [[1,2],[3,4],[5,6],[7,8],[9,10]]
//Start = cut [1..11] 5 // [[1,2],[3,4],[5,6],[7,8],[9,10],[11]]
//Start = cut [] 4
//Start = cut [21] 4
//Start = cut [1..21] 5 // [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16],[17,18,19,20],[21]]



// 9. Extract the first, the middle and last element of a non-empty list with at least 3 elements. 

fml :: [Int]        -> [Int]
fml    ls
| ((length ls) < 3) => []
| otherwise         => [(hd ls), (hd (drop ((length ls) / 2) ls)), (last ls)]


//Start = fml [1..10] // [1,6,10]
//Start = fml [1..11] // [1,6,11]
//Start = fml [1] // []
//Start = fml [] // your list is empty



// 10. Double every second element of a list.
f1 :: [Int]    -> [Int]
f1    []       => []
f1    [x]      => [x]
f1    [x,y:xs] => [x, (y * 2) : (f1 xs)]

//Start = f1 [1,5,3,1,6]  // [1,10,3,2,6]
//Start = f1 [1..10] // [1,4,3,8,5,12,7,16,9,20]
//Start = f1 [1..11] // [1,4,3,8,5,12,7,16,9,20,11]



// 11. Compute the triple of odd numbers and multiply by 10 the even ones.
f2 :: [Int] -> [Int]
f2    []    => []
f2    [x:xs]
| (isOdd x)  = [(x * 3) : (f2 xs)]
| otherwise  = [(x * 10) : (f2 xs)]

//Start = f2 [1..10] // [3,20,9,40,15,60,21,80,27,100]

// 12. write a function that keeps the integers of a list up to the 
// value of the last element. If not found, the full list must be returned.

f3 :: [Int]       -> [Int]
f3    []          => []
f3    [x:xs]
| (x < (last xs)) => (f3 xs)
| otherwise       => [x : (f3 xs)]
//Start = f3 [10, 2, -2, 3, 1, 5, 0, 1] // [10,2,-2,3]
//Start = f3 [1, 2, -2, 3, 5, 0, -4] // [1,2,-2,3,5,0,-4]

// 13. Delete every fourth element of a list.
f4 :: [Int] -> [Int]
f4    []             => []
f4    [a]            => [a]
f4    [a,b]          => [a,b]
f4    [a,b,c]        => [a,b,c]
f4    [a,b,c,d : xs] => [a,b,c : (f4 xs)]

//Start = f4 [1..25] // [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25]

// version 2.
fc4 :: [Int] -> [Int]
fc4    ls    => (init (take 4 ls)) ++ (fc4 (drop 4 ls))

//Start = fc4 [1..25] // [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25]


// 14. Eliminate negatives from a list, if they are on even position.
f5 :: [Int]       -> [Int]
f5    [x,y : xs]
| y < 0           => [x : (f5 xs)]
| otherwise       => [x, y : (f5 xs)]

//Start = f5 [1,2,3,-2,-3,4,-5,-6,-7,8]  // [1,2,3,-3,4,-5,-7,8]

// 15. Compute the N choose K value.
// hint: https://www.mathsisfun.com/combinatorics/combinations-permutations.html

factorial :: Int -> Int
factorial :: 0   => 1
factorial    n   => n * (factorial (n - 1))

n_choose_k :: Int Int -> Int
n_choose_k    n   k   => (factorial n) / ((factorial k) * (factorial (n - k)))

//Start = n_choose_k 5 2
