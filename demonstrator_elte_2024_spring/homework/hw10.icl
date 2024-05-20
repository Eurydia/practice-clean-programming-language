module hw10
import StdEnv

// (BEGIN FIXED)
// NEPTUN code: yyyyyy
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)" but feel free to add or remove everything else.
// Only ".icl" file format will marked and the file name should be "hw10.icl".
// Please comment out all "Start" and ensure that there is no compilation error or runtime error before submission.
// Partial solutions will marked, but only if it does not contain error.
// (END FIXED)

/* Task 1/1
To compose a string, John must familiarize himself with all the letters it contains.

John has a message he wants to write, represented by a string ss. He's wondering what the smallest alphabet size needs to be in order to write this message.

For example, the alphanet of size four includes the first four letters; abcd.

If John wants to write "down", he needs to know the first twenty-three alphabets; abcdefghijklmnopqrstuvw.

Hint: do not overthink!
*/

// (BEING FIXED)
neededLetters :: String -> Int
neededLetters    str    => maxList [(toInt (ch - 'a')) + 1 \\ ch <-: str]
// (END FIXED)

//Start = neededLetters "a" // Expected: 1
//Start = neededLetters "hello" // Expected: 15
//Start = neededLetters "world" // Expected: 23
//Start = neededLetters "apple" // Expected: 16
//Start = neededLetters "banana" // Expected: 14