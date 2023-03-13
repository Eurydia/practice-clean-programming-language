module chlg_01

import StdEnv

/*
Write a function largest_k_digit_number that takes two positive integers
n and k as input and returns the largest k-digit number that is divisible by n.

Here are some additional requirements and guidelines for the task:
- Your function should take two arguments: n and k, both positive integers.
- Your function should return an integer.
- If there is no k-digit number divisible by n, your function should return -1.
- You may assume that k is less than or equal to the number of digits in n.  
*/
 
largest_k_digit_number :: Int Int -> Int 
largest_k_digit_number n k = find_largest candidates
where
    pred :: Int -> Bool
    pred d = (d rem n) == 0

    find_largest :: [Int] -> Int
    find_largest [] = -1
    find_largest c = hd c
    
    candidates :: [Int]
    candidates = filter pred (reverse [(10 ^ (k - 1))..((10 ^ k) - 1)])



//Start = largest_k_digit_number 3 2 // 99 
//Start = largest_k_digit_number 7 4  // 9996
//Start = largest_k_digit_number 20 2  // 80
//Start = largest_k_digit_number 700 3  // 700
//Start = largest_k_digit_number 29 1  // -1