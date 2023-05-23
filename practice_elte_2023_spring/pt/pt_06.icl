module pt_06

import StdEnv

// NEPTUN: B9XP3X


/* 
You are given a tuple of lower and upper bounds and a list of tuples, where the first element is course code and the second one is course score.
Filter the list and return the list of course codes, which have scores greater or equal to the lower bound and less or equal to the upper bound.
*/ 

rangeFilter :: (Int, Int) [(String,Int)] -> [String]
rangeFilter    (up,  lo)  ls             =  [c \\ (c, s) <- ls | s >= up && s<= lo] 

//Start = rangeFilter (10, 15) [("A",12),("B",3),("C",5),("E",14),("F",16)] // ["A","E"]
//Start = rangeFilter (3, 13) [("A",12),("B",3),("C",5),("E",14),("F",16)] // ["A", "B", "C"]
//Start = rangeFilter (5, 7) [] // []
//Start = rangeFilter (15, 3) [("A",12),("B",3),("C",5),("E",14),("F",16)] // []
Start= rangeFilter (0, 2) [("A",12),("B",3),("C",5),("E",14),("F",16)] // []

