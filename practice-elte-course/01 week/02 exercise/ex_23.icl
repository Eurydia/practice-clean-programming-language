module ex_23
import StdEnv

// 23. Keep the tails of a list in 2 versions 
// e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [[2, 3], [4], [7, 8, 9]] 
tails :: [[Int]] -> [[Int]]
tails nss = [t \\ [_:t] <- nss]

//Start = tails [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

tailsd :: [[Int]] -> [[Int]]
tailsd nss = map tl nss
//Start = tailsd [[1, 2, 3], [3, 4], [5, 7, 8, 9]]