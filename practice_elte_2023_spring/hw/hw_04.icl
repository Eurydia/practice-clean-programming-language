module hw_04

import StdEnv

//NEPTUNE CODE: B9XP3X

/* Task 1
    Given a list of characters, extract all the vowel
    characters and count them. After that, cipher the list of characters
    by that count. Ciphering here means just shift the character by that count
   
        For Example:
            let's assume that the vowels count is 2, then:
                'a' + 2 = 'c' ... Here we ciphered 'a' into 'c'
                'c' + 2 = 'e' ... We did the same as above
                Therefore, by ciphering, we just shift the letter into its
                N's neighbor.
           
    Task Example:
        Input is ['m', 'o', 'h', 'i','d','o']  
        count of vowels is 3 (o,i,o)
        We cipher the list:
        ['m', 'o', 'h', 'i','d','o']   ->   ['p','r','k','l','g','r']
       
    Reminder: English vowels are: a, e, i, o, and u.
   
    Note: To shift a letter by N, you can do the following:
        toChar (fromChar letter + n)
*/

isVowel :: Char -> Bool
isVowel c = c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'

cipherList :: [Char] -> [Char]
cipherList cs = [toChar ((toInt c) + shift) \\ c <- cs]
where
	shift :: Int
	shift = length (filter isVowel cs)

//Start = cipherList ['m', 'o', 'h', 'i','d','o']       //  ['p','r','k','l','g','r']
//Start = cipherList ['t', 'a', 'r', 'i', 'q']          //  ['v','c','t','k','s']
//Start = cipherList ['b', 'e', 'k', 'a']               //  ['d','g','m','c']
//Start = cipherList ['a','b','d','u','l','l','a','h']  //  ['d','e','g','x','o','o','d','k']



/* Task 2
    Given two integers, insert the second integer to the first one.
    The insertion should be as follows:
        After each digit considered in the first integer,
        you insert a digit from the second integer.
   
    Example:
        123 321 -> 132231
        13 13   -> 1133
       
    So after each digit in first integer, you insert a digit from
    the second integer.
   
    Note that both given numbers are of equal length.
*/
intInsertion :: Int Int -> Int
intInsertion x y = padded_dx + padded_dy
where
	dx :: [Int]
	dx = [(toInt d) - 48 \\ d <-: (toString x)]
	
	dy :: [Int]
	dy = [(toInt d) - 48 \\ d <-: (toString y)]
	
	size :: Int
	size = (length dx) - 1
	
	digits :: Int
	digits = (size + 1) * 2
	
	padded_dx :: Int
	padded_dx = sum [(dx !! i) * (10 ^ ((digits - 1) - (2 * i))) \\ i <- [0..size]] 

	padded_dy :: Int
	padded_dy = sum [(dy !! i) * (10 ^ ((digits - 2) - (2 * i))) \\ i <- [0..size]] 


//0 -> (6 - ((i + 1) * 2) = 4
//1 -> (6 - 4) = 2
//2 -> (6 - 6) = 0
//                   531 420 
//Start = intInsertion 123 123 // 112233
//Start = intInsertion 123 321 // 132231
//Start = intInsertion 13 13 // 1133
//Start = intInsertion 1 2 // 12
Start = intInsertion 2 1 // 21