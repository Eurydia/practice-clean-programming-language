module hw7
import StdEnv

// (BEGIN FIXED)
// NEPTUN code: yyyyyy
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)" but feel free to add or remove everything else.
// Only ".icl" file format will marked and the file name should be "hw7.icl".
// Please comment out all "Start" and ensure that there is no compilation error or runtime error before submission.
// Partial solutions will marked, but only if it does not contain error.
// (END FIXED)

// Task 1/2
// Given a string, decide whether is a valid Hungarian phone number.
// A valid hungarian phone number must start with the prefix "+36" follow by six or seven decimal digits.

// (BEGIN FIXED)
// isValidPhoneNumber :: String -> Bool
// (END FIXED)

// SAMPLE SOLUTION
isValidPhoneNumber :: String -> Bool
isValidPhoneNumber    str    = ((take 3 lStr) == ['+36']) && (all isDigit (drop 1 lStr)) && ((size str) == 9 || (size str) == 10)
where
  lStr :: [Char]
  lStr = [ch \\ ch <-: str]

// (BEGIN FIXED)
//Start = isValidPhoneNumber "+36123456" // Expected: true
//Start = isValidPhoneNumber "+361234567" // Expected: true
//Start = isValidPhoneNumber "+36123" // Expected: false
//Start = isValidPhoneNumber "+36456789012" // Expected: false
//Start = isValidPhoneNumber "+3a6123456" // Expected: false
//Start = isValidPhoneNumber "+36abc12345" // Expected: false
//Start = isValidPhoneNumber "123456789" // Expected: false
//Start = isValidPhoneNumber "+36123456a" // Expected: false
// (END FIXED)

// Task 2/2
// Define a record type for a student with the following fields:
//    name: a string to represent the student's name
//    score: an integer to represent the student's test score
//    retake: a boolean whether the student retook the test or not
// Given a list of students, implement a function that;
// 1. filter out those students who have not retaken the test,
// 2. filter out those students whose score is not between 50 and 75 (inclusive),
// 3. sort the students bases on their name in ascending alphabetical order.

:: Student = {name::String, score::Int, retake::Bool }

// (BEGIN FIXED)
s1 :: Student
s1 = {name="AAAA", score=45, retake=True}
s2 :: Student
s2 = {name="BBBB", score=50, retake=False}
s4 :: Student
s4 = {name="CCCC", score=50, retake=True}
s3 :: Student
s3 = {name="DDDD", score=60, retake=True}
s6 :: Student
s6 = {name="FFFF", score=80, retake=False}
s7 :: Student
s7 = {name="GGGG", score=80, retake=True}
s8 :: Student
s8 = {name="VVVV", score=75, retake=True}
// (END FIXED)

// (BEGIN FIXED)
// getRetakeThirdQuadrant :: [Student] -> [Student]
// (END FIXED)


// SAMPLE SOLUTION
instance < Student
where
  (<) l r = l.name < r.name
  
getRetakeThirdQuadrant :: [Student] -> [Student]
getRetakeThirdQuadrant    students  = sort [s \\ s <- students | s.retake && s.score >= 50 && s.score <= 75]

// (BEGIN FIXED)
//Start = getRetakeThirdQuadrant [s7,s2,s1,s4] // Expected: [(Student "CCCC" 50 True)]
//Start = getRetakeThirdQuadrant [s7,s3, s6, s2,s1,s4] // Expected: [(Student "CCCC" 50 True),(Student "DDDD" 60 True)]
//Start = getRetakeThirdQuadrant [s6, s2,s1,s4,s7,s8] // Expected: [(Student "CCCC" 50 True),(Student "VVVV" 75 True)]
//Start = getRetakeThirdQuadrant [s1, s2,s3,s4,s6,s7,s8] // Expected: [(Student "CCCC" 50 True),(Student "DDDD" 60 True),(Student "VVVV" 75 True)]
//Start = getRetakeThirdQuadrant [s8, s7,s6,s4,s3,s2,s1] // Expected: [(Student "CCCC" 50 True),(Student "DDDD" 60 True),(Student "VVVV" 75 True)]
// (END FIXED)