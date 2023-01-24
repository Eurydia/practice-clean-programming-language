module midterm_04_task_10

import StdEnv


//// Ciphering
/*10.
Given a list of characters, extract all the vowels and count them.
After that, cipher the list of characters by that count.
Ciphering here means just shift the character by that count.
English vowels are: a, e, i, o, and u.
Example: let's assume that the vowels' count is 2, then:
'a' + 2 = 'c' ... Here we ciphered 'a' into 'c'
'c' + 2 = 'e' ... We did the same as above
For the input ['m', 'o', 'h', 'i','d','o'] count of vowels is 3 o,i,o.
Cipher of the list: ['m', 'o', 'h', 'i','d','o']->['p','r','k','l','g','r'].
*/

isVowel :: Char -> Bool
isVowel c = c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'

countVowels :: [Char] -> Int
countVowels cs = length (filter isVowel cs)

cipherList :: [Char] -> [Char]
cipherList cs = [toChar ((toInt c) + shift) \\ c <- cs ]
where
	shift = countVowels cs

//Start = cipherList ['m', 'o', 'h', 'i','d','o'] // ['p','r','k','l','g','r']
//Start = cipherList ['t', 'a', 'r', 'i', 'q'] // ['v','c','t','k','s']
//Start = cipherList ['b', 'e', 'k', 'a'] // ['d','g','m','c']
Start = cipherList ['a','b','d','u','l','l','a','h'] // ['d','e','g','x','o','o','d','k']
