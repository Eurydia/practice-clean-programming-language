module midterm_03_task_07

import StdEnv 

/* 7. Property check

 Given a list of tuples, write a function to determine
 whether all of the tuples inside of the list hold the (Even, Odd) property.
 [(2,1),(2,3),(4,1)] = True
*/

checkTuple :: (Int, Int) -> Bool
checkTuple t = isEven (fst t) && isOdd (snd t)

holdsTrue :: [(Int, Int)] -> Bool
holdsTrue [] = False
holdsTrue ts = all checkTuple ts

//Start = holdsTrue [(2,1),(2,3),(4,1)] // True
//Start = holdsTrue [(1,3),(2,3),(3,4)] // False
Start = holdsTrue [] // False
