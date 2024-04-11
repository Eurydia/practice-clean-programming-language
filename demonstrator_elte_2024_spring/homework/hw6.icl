module hw6
import StdEnv

// (BEGIN FIXED)
// NEPTUN code: yyyyyy
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)" but feel free to add or remove everything else.
// Only ".icl" file format will marked and the file name should be "hw6.icl".
// Please comment out all "Start" and ensure that there is no compilation error or runtime error before submission.
// Partial solutions will marked, but only if it does not contain error.
// (END FIXED)

// Task 1/2
// Given two strings of lowercase latin alphabets, implement a function that checks whether the first string is a substring of the second string or not.
// (BEGIN FIXED)
//isSubstring :: String String -> Bool
// (END FIXED)

// (BEGIN FIXED)
//Start = isSubstring "cat" "catch" // Expected: True
//Start = isSubstring "apple" "applepie"  // Expected: True
//Start = isSubstring "pie" "applepie"  // Expected: True
//Start = isSubstring "banana" "applepie" // Expected: False
//Start = isSubstring "" "applepie" // Expected: True
//Start = isSubstring "cat" ""  // Expected: False
//Start = isSubstring "" "" // Expected: True
//Start = isSubstring "abcdef" "abc"  // Expected: False
//Start = isSubstring "cat" "cat" // Expected: True
//Start = isSubstring "CAT" "catch" // Expected: False
// (END FIXED)

// Task 2/2
// Given a list of 2-tuples, the first component of each tuple is a integer, and the second component is a character. Implement a function that
// - ignores the tuple if the integer is odd,
// - create a string, whose length is equal to the integer, using the given character.
// Example:
//    Input: [(4,'c'), (3, 'a')]
//    Output: ["cccc"]
//    Exaplanation: The second tuple is skipped since the integer is odd.
// Example:
//    Input: []
//    Output: []
// Example:
//    Input: [(-2, 'x'), (4, 'y')]
//    Output: "Invalid, an integer appears to be negative"

// (BEGIN FIXED)
//stringBuilder :: [(Int, Char)] -> [String]
// (END FIXED)

// (BEGIN FIXED)
//Start = stringBuilder [(4,'c'), (3, 'a')] // - Expected Output: ["cccc"]
//Start = stringBuilder [] // - Expected Output: []
//Start = stringBuilder [(-2, 'x'), (4, 'y')] // - Expected Output: "Invalid, an integer appears to be negative"
//Start = stringBuilder [(5,'a'), (2, 'b'), (6, 'c')] // - Expected Output: ["bb", "cccc"]
//Start = stringBuilder [(3,'x'), (4, 'y'), (2, 'z')] // - Expected Output: ["yyyy", "zz"]
// (END FIXED)