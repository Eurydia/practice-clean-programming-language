module ex_29
import StdEnv

// 29. check if a number is palindrom e.g.12321
//p :: Int -> [Int]

//digits :: Int [Int] -> [Int]

//Start = digits 12321 []
// digits 12321 []
// digits 1232 [1:[]]
// digits 123 [2:[1:[]]]
// digits 12 [3:[2:[1:[]]]]
// digits 1  [2:[3:[2:[1:[]]]]]
// digits 0  [1:[2:[3:[2:[1:[]]]]]]
// digits 0 [1,2,3,2,1]
// [1,2,3,2,1]

pali :: Int -> Bool
pali n = all (\(index) = (n_digits !! index) == (n_digits_rev !! index)) [0..((length n_digits) - 1)]
where
	n_digits = [c \\ c <-: (toString n)]
	n_digits_rev = reverse n_digits

//Start = pali 12321 // True
//Start = pali 12345