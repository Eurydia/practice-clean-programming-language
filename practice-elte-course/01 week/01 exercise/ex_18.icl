module ex_18
import StdEnv

// 18. Write a function that takes two arguments, say n and x, and computes their power,
// in 2 versions - with recursion and without recursion.
power :: Int Int -> Int
power b p = b ^ p

//Start = power 2 5 // 32

powerrec  :: Int Int -> Int
powerrec b 0 = 1
powerrec b p = b * (powerrec b (p - 1))

//Start = powerrec 2 0 // 1
//Start = powerrec 2 4 // 16
// powerrec 2 4
// 2 * powerrec 2 3
// 2 * 2 * powerrec 2 2
// 2 * 2 * 2 * powerrec 2 1
// 2 * 2 * 2 * 2 * powerrec 2 0
// 2 * 2 * 2 * 2 * 1
// 16