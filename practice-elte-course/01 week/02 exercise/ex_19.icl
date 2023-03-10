module ex_19
import StdEnv

// 19. Keep the first 2 and the last 2 elements of a list
droptake2 :: [Int] -> [Int]
droptake2 ns
| size <= 4 = ns
= [(ns !! 0), (ns !! 1), (ns !! (size - 2)), (ns !! (size - 1))]
where
	size = length ns

//Start = droptake2 [1, 2, 3, 4, 5, 6, 7, 8, 9]
//Start = droptake2 [1, 2]