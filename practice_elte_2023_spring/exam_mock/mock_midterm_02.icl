module mock_exam_02
import StdEnv

// NEPTUNE: B9XP3X
stringToCharList :: String -> [Char]
stringToCharList string = fromString string
 
charListToString :: [Char] -> String
charListToString charList = toString charList

addTwoNumber x y = x + y
prodTwoNumber x y = x * y
niceTwoNumber x y = x rem y

/* 1. Higher Order Function

 Implement the function zipWith that takes a function, 
 and two lists, and combines them in such a way that 
 elements that are in the same positions get the function 
 applied to them.

 E.g: zipWith addTwoNumbers [1,2,3] [5,6,7] = [1+5,2+6,3+7] = [6,8,10]
*/

zipWith :: (Int Int -> Int) [Int] [Int] -> [Int]
// zipWith fn xs ys = [fn x y \\ x <- xs & y <- ys]

zipWith _  []     [] = []
zipWith _  _      [] = []
zipWith _  []     _  = []
zipWith fn [x:xs] [y:ys] = [(fn x y) : (zipWith fn xs ys)]
zipWith fn [x:xs] [y:ys] = [fn x y] ++ (zipWith fn xs ys)

//Start = zipWith addTwoNumber [1,2,3] [5,6,7] // [6,8,10]
//Start = zipWith prodTwoNumber [1,2,3] [5,6,7] // [5,12,21]
//Start = zipWith niceTwoNumber [5,6,7] [1,2,3] // [0,0,1]

/*********************************************************************************************************************/

/* 2. Tuple

 Given a list of triple tuples consisting of two integer values and 
 and a list of integers (left,right,[Int]),
 for every tuple return only the elements from the list 
 which positions' are inside the interval [left..right]
 Assume that the indexes are all valid.
 
 fst3, snd3, thd3 has to be used for claiming the values of 3-element tuple.
*/

// x = [1..5]
// x !! 0 -> 1
// x !! 1 -> 2
// x !! 2 -> 3
// x !! 3 -> 4
// x !! 4 -> 5

// x % (0, 3) -> [1, 2, 3, 4]
// x % (3, 4) -> [4, 5]

elementInInterval :: [(Int ,Int,[Int])]-> [[Int]]
elementInInterval ts = [ls % (l, r) \\  (l, r, ls) <- ts]
// [[Int]]
// [\\  [x:xs] <- ls]

//Start = elementInInterval [(2,5,[1..10])] //[[3,4,5,6]]
//Start = elementInInterval [(5,6,[1..8]), (3,5,[4..9])] //[[6,7],[7,8,9]]
//Start = elementInInterval [(4,7,[1,2,3,4,5,6,7,8,9])] //[[5,6,7,8]]

/*********************************************************************************************************************/

/* 3. List Comprehension
	Write a function that takes every number in a list and generates a sublist of its first 5 multiples.
*/

generator :: [Int] -> [[Int]]
generator ns = [([n * m \\ m <- [1..5]]) \\ n <- ns]

//Start = generator [1..3] //[[1,2,3,4,5],[2,4,6,8,10],[3,6,9,12,15]]
//Start = generator [4,~3,5,~6] //[[4,8,12,16,20],[-3,-6,-9,-12,-15],[5,10,15,20,25],[-6,-12,-18,-24,-30]]
//Start = generator [] //[]

/*********************************************************************************************************************/

/* 4. Logic
    Write a function that checks if a list of numbers is odd,even,odd,even...
    For exmaple: SeqCheck [1,2,3,4,6] = False because 4 is even, but 6 is not odd.
*/

SeqCheck :: [Int] -> Bool
SeqCheck ns = and [(isOdd i) == (isOdd n) \\ n <- ns & i <- [1..]]

//F <==> F -> T
//T <==> T -> T
//T <==> F -> F
//F <==> T -> F


//Start = SeqCheck [1..10] //True
//Start = SeqCheck [1,2,3] //True
//Start = SeqCheck [2,3,4] //False
//Start = SeqCheck [1,3,4,5] //False
//Start = SeqCheck [1,2,3,4,6,7] //False
//Start = SeqCheck [] //False

/*********************************************************************************************************************/

/* 5. List Comprehension + String
 Write function that takes String as input and removes vowels from it
*/

isVowel :: Char -> Bool
isVowel    c    = isMember lc ['a', 'e', 'i', 'o', 'u'] // 'A'
// isVowel c = lc == 'a' || lc == 'e' || lc == 'i' || lc == 'o' || lc == 'u'
where
	lc :: Char
	lc = toLower c

removeVowels :: String -> String
removeVowels    str    =  {c \\ c <-: str | not (isVowel c)}

//Start = removeVowels "Xola" // "Xl"
//Start = removeVowels "Functional Programming" // "Fnctnl Prgrmmng"
//Start = removeVowels "Clean is the best" // "Cln s th bst"
//Start = removeVowels "Not really" // "Nt rll"
//Start = removeVowels "" // ""
//Start = removeVowels "N vwls hr" // "N vwls hr"

/*********************************************************************************************************************/

/* 6. Numerical + Recursion
 If sum of cubes of each digit of the number is equal to the number itself,
 then the number is called an Armstrong number.
 153 = 1^3 + 5^3 + 3^3
 Given a positive integer number, write a function to determine whether it is
 an Armstrong number or not.
*/

toDigits :: Int -> [Int]
toDigits n = [(toInt d) - 48 \\ d <-: (toString n)]

armstrong :: Int -> Bool
armstrong n = n == (sum [d ^ l \\ d <- nDigits])
where
	nDigits :: [Int]
	nDigits = toDigits n
	
	l :: Int
	l = length nDigits

//Start = armstrong 153 // True
//Start = armstrong 370 // True
//Start = armstrong 0 // True
//Start = armstrong 12 // False

/*********************************************************************************************************************/

/* 7. List Pattern + Recursion
 
 Implement a search algorithm that searches through a list for Int n and returns the value in the list before n. 
 If there is no value, or the list is empty, return -1. e.g., findPrev 5 [1,2,3,4,5,6] should return 4, 
 while findPrev 5 [0, 10, 20, 30] returns -1.
*/

findPrev :: Int [Int] -> Int
findPrev n xs
| candidates == [] = -1
| otherwise = hd candidates
where
	candidates :: [Int]
	candidates = [xs !! i \\ i <- [0..((length xs) - 2)] | (xs !! (i + 1)) == n]
 
//Start = findPrev 5 [1,2,3,4,5,6] // 4
//Start = findPrev 1 [1,2,3,4,5,6] // -1
//Start = findPrev 1 [] // -1 

/*********************************************************************************************************************/

/* 8. List Pattern + Recursion

 Given a list of numbers, return True if the  
 the difference between two consecutive elements is always 2
 otherwise return False
*/

gap2C :: [Int] -> Bool
gap2C ns = and [abs ((ns !! i) - (ns !! (i + 1))) == 2 \\ i <- [0..(len - 2)]]
where
	len :: Int
	len = length ns

//Start = gap2C [1,3,5,7] // True
//Start = gap2C [1,3,5,7,9,11,13,15] // True
//Start = gap2C [1,5,8] // False
//Start = gap2C [] // False

/*********************************************************************************************************************/

/*	9. List Comprehension, Tuple, or Recursion
	A list of tuple (String, Char, Int) and you need to transform the whole list of tuple into the list of integer (0 and 1) values which represents Boolean.
	The condition is that if the given string contains the given char at least the given integer times.
		
	1 represents True and 0 represents False.
	
	For example: [("pjifcoajofoj", 'o', 2), ("idsjodpcd", 'i', 2),............]
	
	Then the result will be [1,0,......]; 
	Explanation: for the first tuple: there are 3 'o' inside the given string and the given integer is 2, ('o' has at least 2 frequency inside the string), so the first tuple is True and you store 1 for the first tuple.
				 for the second tuple: there are 1 'i' inside the given string and the given integer is 2, (the given string doesn't have at least 2 'i') so, the second tuple is False and you store 0 for the second tuple.
*/


countFreq :: (String,Char,Int) -> Int
countFreq (str, c, f)
| length (filter ((==) c) [ch \\ ch <-: str]) >= f = 1
| otherwise = 0

checkEnoughFrequency :: [(String, Char, Int)] -> [Int]
checkEnoughFrequency ts = [countFreq t \\ t <- ts]

// {c \\ c <- chars}

//Start = checkEnoughFrequency [("jofjsfoajof", 'f', 2), ("mxbawpedep", 'b', 2), ("pkaowacwidojoadw", 'w', 3)]		// [1,0,1]
//Start = checkEnoughFrequency [("", 'o', 0), ("fds", 'i', 2)] 													// [1, 0]
//Start = checkEnoughFrequency [] 																				// []
//Start = checkEnoughFrequency [("fffff", 'f', 3),("ppppp", 'p', 5)] 												// [1,1]
