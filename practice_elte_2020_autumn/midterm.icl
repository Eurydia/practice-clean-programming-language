module midterm

import StdEnv
import StdDebug

/* 1.
Given a list of Integers, write a function which will keep only the numbers divisble by 10 but not divisible by 4,
and remove the rest.
[10,20..100] = [10,30,50,70,90] beacause 20,40,60,80,100 are divisible by both 10 and 4
*/

removeDiv10No4::[Int] -> [Int]
removeDiv10No4 ns = filter pred ns
where
	pred :: Int -> Bool
	pred n = n rem 10 == 0 && not (n rem 4 == 0)

//Start = removeDiv10No4 [10,20..100]//[10,30,50,70,90]
//Start = removeDiv10No4 [4,8..30]//[]
//Start = removeDiv10No4 [0,5..50]//[10,30,50]
//Start = removeDiv10No4 []

/* 2.
Write a function that converts binary numbers to decimal numbers.
Each digit of a binary number corresponds to a power of two.
For example: 
10010 = 1 0 0 1 0 = 1*(2^4) + 0*(2^3) + 0*(2^2) + 1*(2^1) + 0*(2^0) = 18
Note the correspondance between 1's and 0's and their multiplication with
the respective powers of two.
*/

binaryToDecimal :: Int -> Int
binaryToDecimal nb = sum (map convert (indexList digits)) 
where
	digits = [(toInt d) - 48 \\ d <-: toString nb]
	size = length digits
	convert :: Int -> Int
	convert index = digit * (2 ^ power) 
	where
		digit = digits !! index
		power = size - index - 1

//Start = binaryToDecimal 1 // 1
//Start = binaryToDecimal 0 //0
//Start = binaryToDecimal 10010 //18
//Start = binaryToDecimal 1010101010101 //5461

/* 3.
Given a list of lists, for each list, extract the smallest, medium and largest elements. 
*/

extract :: [[Int]] -> [(Int, Int, Int)]
extract nss = map doExtract (filter pred nss)
where 
	pred :: [Int] -> Bool
	pred ns = ns <> []
	doExtract :: [Int] -> (Int, Int, Int)
	doExtract ns = (min_val, med_val, max_val)
	where
		sorted = sort ns
		size = length sorted
		min_val = sorted !! 0
		max_val = sorted !! (size - 1)
		med_val = sorted !! (size / 2)
		
//Start = extract [[]] //[]
//Start = extract [[1..9], [2..6], [3..11], [1..10]] // [(1,5,9),(2,4,6),(3,7,11),(1,6,10)]
//Start = extract [[11..19], [2..20], [3..11]] // [(11,15,19),(2,11,20),(3,7,11)]

/* 4.
Write a function that takes a condition, and a list of tuples,
and returns a single tuple which is the sum of all tuples
which satisfy the condition.
Assume the sum of two tuples (a,b) + (c,d) is equal to (a+c, b+d)
*/

selectiveSum :: ( (Int,Int) -> Bool) [(Int,Int)] -> (Int,Int)
selectiveSum pred ts = tuple_sum (filter pred ts) (0, 0)
where
	tuple_sum :: [(Int, Int)] (Int, Int) -> (Int, Int)
	tuple_sum [] accum_t = accum_t
	tuple_sum [h:t] accum_t = tuple_sum t ((fst accum_t) + (fst h), (snd accum_t) + (snd h)) 
	 
//Start = selectiveSum (\(a,b) -> False) [(1,2),(2,3),(3,4),(4,3),(2,1),(3,2),(1,1),(0,10),(45,-152)] // (0,0)
//Start = selectiveSum (\(a,b) -> a < b) [(1,2),(2,3),(3,4),(4,3),(2,1),(3,2),(1,1),(0,10),(45,-152)] // (6,19)
//Start = selectiveSum (\(a,b) ->  isEven a && isOdd b) [(1,2),(2,3),(3,4),(4,3),(2,1),(3,2),(1,1),(0,10),(45,-152)] // (8,7)
//Start = selectiveSum (\(a,b) -> a > 0 && a < 20 && b > 0 && b < 20)  [(1,2),(2,3),(3,4),(4,3),(2,1),(3,2),(1,1),(0,10),(45,-152)] // (16,16)

/* 5.
Given a list of points, represented as tuple of real numbers, create a list
containing all the unique distances between them. (Here by unique we mean for two points a and b we only have to calculate the distance from A to B
and not from B to A as well)
Do not compute distance of a point to itself.
Distance between two points A and B can be found by the formula : square root of ((A.x - B.x)^2 + (A.y - B.y)^2) . 
Here a point A is represented as a tuple (x,y) where first element is the coordinate x and the second is the coordinate y
*/

// Strategy: 
// -> create a list of non-unique distance
// -> filter unique distance 

findDistance :: [(Real, Real)] -> [Real]
findDistance ts
| (length ts) < 2 = [] 
| otherwise = find_distance [] zero 
where
	find_distance :: [Real] Int -> [Real]
	find_distance accum index
	| index > ((length ts) - 2) = accum
	| otherwise = find_distance (accum ++ distances) (index + 1)
	where
		distances :: [Real]
		distances = [compute_distance (ts !! index) (ts !! d_index) \\ d_index <- [(index + 1)..((length ts) - 1)]]
			
	compute_distance :: (Real, Real) (Real, Real) -> Real
	compute_distance (ax, ay) (bx, by) = (((ax - bx) ^ 2.0) + ((ay - by) ^ 2.0))^ 0.5 

//Start = findDistance [(1.0,1.0),(4.0,5.0)] //[5]
//Start = findDistance [(1.0,1.0),(4.0,5.0),(1.0, ~6.0),(~1.0,~3.0)]
//[5,7,11.4017542509914,4.47213595499958,9.4339811320566,3.60555127546399]
//Start = findDistance [] // []
//Start = findDistance [(1.0,1.0)] //[]

/*6.
Given a list of lists of Integers and an Integer.
Write a function which will return a list of the maximal elements of each list which are smaller than the given Int.
It is guaranteed that each list has at least one element less than the given Int
NOTE: [[1,3],[1,4]] 2  = [1,1] and not []
*/
maxLessThanN::[[Int]] Int -> [Int]
maxLessThanN nss x = map getSmaller nss
where
	getSmaller :: [Int] -> Int
	getSmaller ns = maxList (filter pred ns)
	where
		pred :: Int -> Bool
		pred n = n < x

//Start =  maxLessThanN [[1,3],[1,4]] 2//[1,1]
//Start =  maxLessThanN [[5,2,3,5,2,3,7],[2],[2,3,2,1],[-12,5,7]] 3//[2,2,2,-12]
//Start =  maxLessThanN [[6,2,9],[1,3,1,4],[1..10]] 9//[6,4,8]
//Start =  maxLessThanN [] 4 //[]

/* 7.
Given a list of integers, return a list of tuples:
write a function which goes through the element and for every
element i, return a tuple:
where the first element is the i-th Fibonnaci number,
and the second element is the product of all previous Fibonnaci numbers
Example [0,1,2] -> [(1,1),(1,1),(2,2)]
*/

generateFib :: [Int] -> [(Int, Int)]
generateFib ns = [(getFib n, prod (getFibList n))  \\ n <- ns]
where
	getFib :: Int -> Int
	getFib 0 = 1
	getFib 1 = 1
	getFib n = getFib (n - 1) + getFib (n - 2)
	
	getFibList :: Int -> [Int]
	getFibList n = [getFib index \\ index <- [0..n]]

//Start = generateFib [0,1,2] // [(1,1),(1,1),(2,2)]
//Start = generateFib [3,7,11] //[(3,6),(21,65520),(144,1570247078400)]
//Start = generateFib [4..10] //[(5,30),(8,240),(13,3120),(21,65520),(34,2227680),(55,122522400),(89,10904493600)]

/* 8.
Given two integers x and n ,write a function which generates a list of the first n prime numbers
starting from a number x.
Both x and y should be positive.
A prime number is a number which is divisible only by 1 and itself.
1 is not a prime number
*/

isPrime :: Int -> Bool
isPrime 1 = False
isPrime n = and [(n rem d) <> 0 \\ d <- [2..(n - 1)]]

listOfPrimes :: Int Int -> [Int]
listOfPrimes x n
| x < 0 || n < 0 = []
| otherwise = generatePrimes x []
where
	generatePrimes :: Int [Int] -> [Int]
	generatePrimes curr accum
	| (length accum) == n = accum
	| isPrime curr = generatePrimes (curr + 1) (accum ++ [curr])
	| otherwise = generatePrimes (curr + 1) accum

//Start = listOfPrimes 10 5 // [11,13,17,19,23]
//Start = listOfPrimes 1000 10 // [1009,1013,1019,1021,1031,1033,1039,1049,1051,1061]
//Start = listOfPrimes -10 3 // []
//Start = listOfPrimes 100 -4 // []
//Start = listOfPrimes 100 0 // []


/* 9.
Write a function which generate the Aliquot sequence of number k
Definition:
In mathematics, an aliquot sequence is a sequence of positive integers
in which each term is the sum of the proper divisors of the previous term.
For example, the aliquot sequence of 10 is 10, 8, 7, 1, 0 because:
 divisors of 10 = 5,2,1   their sum = 8
 divisors of 8 = 4,2,1    their sum = 7
 divisors of 7 = 1        their sum = 1
 divisors of 1 = 0        their sum = 0
*/

getSeq :: Int -> [Int]
getSeq 0 = [0]
getSeq n = [n:(getSeq (getDivisorSum n))]
where
	getDivisorSum :: Int -> Int 
	getDivisorSum x = sum (filter pred [1..(x / 2)])
	where
		pred :: Int -> Bool
		pred d = (x rem d) == 0
//Start = getSeq 10 //[10,8,7,1,0]
//Start = getSeq 11 // [11,1,0]
//Start = getSeq 9 //[9,4,3,1,0]
//Start = getSeq 100 //[100,117,65,19,1,0]

/* 10.
Write the function which is given the line from the pascal triangle
and calculates next line based on it.
Note: In pascal triangle there are n elements in n-th line. First and
last elements of each line are 1s. Others are calculated based on the
previous line: k-th element is equal to previous line's (k-1)-th and k-th
elements sum. pascal(i,k) = pascal(i-1,k-1) + pascal(i-1,k) for all
elements except first and last.
First 5 levels of pascal triangle:
lvl1: 1
lvl2: 1 1
lvl3: 1 2 1
lvl4: 1 3 3 1
lvl5: 1 4 6 4 1
*/

pascalLine :: [Int] -> [Int]
pascalLine [] = [1]
pascalLine [1] = [1,1]
pascalLine ns = [1] ++ (createLine [0..((length ns) - 2)]) ++ [1]
where
	createLine :: [Int] -> [Int]
	createLine indexes = [(ns !! i) + (ns !! (i + 1)) \\ i <- indexes]

//Start = pascalLine [] // [1]
//Start = pascalLine [1] // [1,1]
//Start = pascalLine [1,1] // [1,2,1]
//Start = pascalLine [1,4,6,4,1] // [1,5,10,10,5,1]
//Start = pascalLine [1,6,15,20,15,6,1] // [1,7,21,35,35,21,7,1]

/* 11
Determine the prime factors of a given positive integer.
Construct a list containing the prime factors and their multiplicity in a tuple.
Natural number N > 1 is prime if it is divisible only by 1 and N.
Multiplicity is how many times number can be divided by another one.
Example: multiplicity of 3 in 9 is two, since we can divide 9 by 3 two times.
Another example: multiplicity of 2 in 24 is 3, since 24 can be divided by 2 three times.
*/

primeFactors :: Int -> [(Int, Int)]
primeFactors n = [(d, getMul n d) \\ d <- (getDivisors n)]
where
	getDivisors :: Int -> [Int]
	getDivisors t
	| t < 0 = filter pred [2..(t * -1)]
	| otherwise = filter pred [2..t]	
	where
		pred :: Int -> Bool
		pred d = (isPrime d) && ((t rem d) == 0)	
	
	getMul :: Int Int -> Int
	getMul t d
	| t rem d <> 0 = 0
	| otherwise = 1 + getMul (t / d) d
	
//Start = primeFactors 13 // [(13, 1)]
//Start = primeFactors 9 // [(3, 2)]
//Start = primeFactors 315 // [(3,2),(5,1),(7,1)]
//Start = primeFactors -315 // [(3,2),(5,1),(7,1)]
//Start = primeFactors 0 // []
//Start = primeFactors 1 // []

/* 12.
Generate the combinations of K distinct objects chosen from the N elements of a list
In how many ways can a committee of 3 be chosen from a group of 12 people?
We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficients).
We want to really generate all the possibilities in a list.
*/

combinations :: Int [a] -> [[a]]
combinations 0 _ = [[]]
combinations _ [] = []
combinations n [x:xs] = (map (\(n) -> [x:n]) (combinations (n - 1) xs)) ++ (combinations n xs)

// Diffucult*

//Start = combinations 5 [1,2,3,4,5] // [[1,2,3,4,5]]
//Start = combinations 5 [1,2,3] // []
//Start = combinations 2 ["a", "b", "c", "d"] // [["a","b"],["a","c"],["a","d"],["b","c"],["b","d"],["c","d"]]
//Start = length (combinations 3 ['a'..'z']) // 2600
//Start = combinations 2 [True, False, True] // [[True,False],[True,True],[False,True]]
