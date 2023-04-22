module pt_05

import StdEnv

//Enter your Neptun: B9XP3X

/* Every sublist contains two numbers x and y. Transform the lists so that
1. if y is even change the sublist so that x is written y times
2. if y is odd, remove that sublist
Example:
pt5 [[1,2], [1,4], [10, 5], [3,3]] = [[1,1], [1,1,1,1]] */

pt5 :: [[Int]] -> [[Int]]
pt5 lls = [(repeatn y x) \\ [x, y] <- lls | isEven y]
//pt5 lls = [ ( [x \\ _ <- [1..y]] ) \\ [x, y] <- lls | isEven y]
    
//Start = pt5 [[1,2], [1,4], [10, 5], [2,3]] //= [[1,1], [1,1,1,1]]
//Start = pt5 [[2,3], [4,5], [5,6], [6,7], [8,8]] // [[5,5,5,5,5,5], [8,8,8,8,8,8,8,8]]
//Start = pt5 [[1,0], [0,1]] //= [[]]
//Start = pt5 [[]] //= [[]]