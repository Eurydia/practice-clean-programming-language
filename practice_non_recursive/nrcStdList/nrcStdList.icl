module nrcStdList

import StdEnv
import StdDebug

// --------------------------------
// overloads
// --------------------------------
// instance length []
//    where
//        length :: [a] -> Int
//        length xs = reduce zero xs
//        where 
//            reduce :: Int [a] -> Int
//            reduce 



// --------------------------------
// standard functions
// --------------------------------

nrchd :: ![a] -> a
nrchd [] = abort "nrc_hd called on []"
nrchd as = (as !! 0)

nrctl :: ![a] -> [a]
nrctl [] = abort "nrc_tl called on []"
nrctl as = [as !! index \\ index <- [1..((length as) - 1)]]

nrclast :: ![a] -> a
nrclast [] = abort "nrc_last called on []"
nrclast as = (as !! ((length as) - 1))

nrcinit :: ![a] -> [a]
nrcinit [] = abort "nrc_init called on []"
nrcinit as = [as !! index \\ index <- [0..((length as) - 2)]]

nrctake :: !Int [a] -> [a]
nrctake n as = [as !! index \\ index <- [0..(n - 1)]]

nrctakeWhile

