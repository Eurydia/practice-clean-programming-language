module ex_28
import StdEnv

// 28. write a funtion with the patterns depending on the parameter:
// if the param is [] then is equal to 20, if is a two element list starting with 4 then is 30
// if is a two element list ending with 5 then is 40, in all other cases is 50, 
// the order of the patterns is important
gp :: [Int] -> Int
gp ns
| (length ns) == 0 = 20
| ((length ns) == 2) && ((ns !! 0) == 4) = 30
| ((length ns) == 2) && ((ns !! 1) == 5) = 40
= 50

//Start = gp [4, 6] // 30
//Start = gp [4, 5] // 30
//Start = gp [1..10]