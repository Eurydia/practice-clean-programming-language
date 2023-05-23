module hw_02

import StdEnv

//Please write your Neptun code here: B9XP3X
/*
Your submission should not have any errors when running the code.

It is possible to get partial points for not working code, but please make sure you comment out the errors.

You should not delete anything from the given code, given test cases should stay the same, but you can add
your tests as well. Don't change the given function signatures, however, you can add as many functions as
you wish, just make sure to name them appropriately (if a function squares the number, call it 'square',
'second_power', etc. and not 'f' or 'g'). The same goes for variable names.

Make sure that you comment all 'Start'-s before submitting the code.


Hints:
    1. The basis of functional programming is functions, if a problem can't be solved
    with one function divide it into multiple functions.
    2. To abort with a message you can use the 'abort' function.
    3. The logic needs to be thought by you, the implementation you can figure out
    by going through lecture slides and practice material.
*/


// SOLVE TWO OF THE FOLLOWING TASKS:




/* 1- Top K Frequent Elements
    Given an integer list(nums) and an integer(k), return the k most frequent elements.
    You may return the answer in any order.
    You may assume that the input is valid, you don't have to validate the input,
    meaning that for example, you won't get [1,1,1] 3 or [1,1,1,3,4,5] 2.
*/

// unique :: [Int] -> [Int]
// unique [] = []
// unique [x:xs] = [x : unique (filter isNotX xs)]
// where
// 	isNotX :: Int -> Bool
// 	isNotX n = n <> x

// NOTE:
// There is a builtin function called `removeDup`
// which does the same thing as `unique` in this case

freq :: [Int] Int -> Int
freq ns x = length (filter isX ns)
where
	isX :: Int -> Bool
	isX n = n == x

top_k_freq_elems :: [Int] Int -> [Int]
top_k_freq_elems ns x = result % (0, (x - 1))
where
	result :: [Int]
	result = [hd t \\ t <- freq_arr]
	
	freq_arr :: [[Int, Int]]
	freq_arr = sortBy orderFreq [[n, freq ns n] \\ n <- removeDup ns]
	
	orderFreq :: [Int, Int] [Int, Int] -> Bool
	orderFreq [na, freqa] [nb, freqb] = freqa > freqb	

//Start = top_k_freq_elems [1,1,1,2,2,3] 2 // [1,2]
//Start = top_k_freq_elems  [1,1,2,1,2,3,3,3,3] 3 // [3,2,1] ??
//Start = top_k_freq_elems  [1] 1 // [1]
//Start = top_k_freq_elems  [3,3,3] 1 // [3]
//Start = top_k_freq_elems  [1,2,3] 3 // [1,2,3]
//Start = top_k_freq_elems  [1,3,2,3] 3 // [1,2,3] ??

/*2- You are given a list of characters(let us call it letters) that is sorted in non-decreasing order,
    and a character (target). There are at least two different characters in "letters".

    Return the smallest character in "letters" that is lexicographically greater than target.
    If such a character does not exist, return the first character in "letters".

    Example 1:
        Input: letters = ['c','f','j'], target = 'a'
        Output: 'c'
        Explanation: The smallest character that is lexicogrpahically greater than 'a' in letters is 'c'.

    Example 2:
        Input: letters = ['c','f','j'], target = 'c'
        Output: 'f'
        Explanation: The smallest character that is lexicographically greater than 'c' in letters is 'f'.

    Example 3:
        Input: letters = ['x','x','y','y'], target = 'z'
        Output: 'x'
        Explanation: There are no characters in letters that is lexicographically greater than 'z' so we return letters[0].
   

    Constraints:
    2 <= letters.length <= 104
    letters at position "i" is a lowercase English letter.
    letters are sorted in non-decreasing order.
    letters contain at least two different characters.
    target is a lowercase English letter.
*/



findGreater ::  [Char] Char -> Char  
findGreater chars t
| (length candidates) == 0 = hd chars
| otherwise = hd candidates
where
	candidates :: [Char]
	candidates = filter isGreater chars

	isGreater :: Char -> Bool
	isGreater c = c > t

//Start = findGreater ['c','f','j'] 'c' // 'f'
//Start = findGreater ['x','x','y','y'] 'z' // 'x'
//Start = findGreater ['a','b','c'] 'd' // 'a'
//Start = findGreater ['c','f','j'] 'a' // 'c'  


/*3- Given a list of integers, write a function that iterates through every element and returns a list of lists of Fibonacci sequences as shown in the example.
    The elements of the list indicate how many Fibonacci numbers are in the corresponding sublist and the Fibonacci sequence will continue in the next sublist.
    (Assume there is no negative integer in the list)
   
    example: fibList [3,2,1,2] = [[1,1,2],[3,5],[8],[13,21]]
             fibList [2,5,3] = [[1,1],[2,3,5,8,13],[21,34,55]]
*/

nFirstFib :: Int -> [Int]
nFirstFib 1 = [1]
nFirstFib 2 = [1, 1]
nFirstFib n = reverse (nFib [1, 1])
where
	nFib :: [Int] -> [Int]
    nFib x
    | (length x) == n = x
    | otherwise = nFib [(a + b) : x] 
    where
        [a:[b:_]] = x

fibList::[Int] -> [[Int]]
fibList ns = parti ns fib_seq
where
	fib_seq :: [Int]
	fib_seq = nFirstFib (sum ns)
	
	parti :: [Int] [Int] -> [[Int]]
	parti [] seq = []
	parti [i:ix] seq = [(take i seq) : (parti ix (drop i seq))]
	
//Start = fibList [4,5,3,2] // [[1,1,2,3],[5,8,13,21,34],[55,89,144],[233,377]]
//Start = fibList [] // []
//Start = fibList [10,5] // [[1,1,2,3,5,8,13,21,34,55],[89,144,233,377,610]]
