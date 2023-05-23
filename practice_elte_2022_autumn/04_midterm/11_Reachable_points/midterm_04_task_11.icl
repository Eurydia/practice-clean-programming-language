module midterm_04_task_11

import StdEnv


//// Reachable points
/*11.
Given coordinates of a source point (x1, y1) determine if it is possible to reach
the destination point (x2, y2). All coordinates are positive.
From any point (x, y) there are only two types of valid movements: (x, x + y)
and (x + y, y). Return a Boolean True if it is possible, else return False.
Example: source point: (2, 10)
destination point: (26,12)
output: True (2, 10)->(2, 12)->(14, 12)->(26, 12) is a valid path.
*/


reachable :: Int Int Int -> Bool
reachable x y t = ((t rem y) rem x) == 0

//isReachable :: (Int,Int) (Int,Int) -> Bool
isReachable ta tb = (reachable xa ya xb) && (reachable xa ya yb)
where
	xa = fst ta
	ya = snd ta
	xb = fst tb
	yb = snd tb


//ax1 + by1 = x2
//a = (x2 rem y1) / x1 -> integer -> ok


//Start = isReachable (2, 10) (26, 12) // True
//Start = isReachable (4, 20) (52, 24) // True
//Start = isReachable (8, 40) (104,48) // True
//Start = isReachable (6, 12) (20, 10) // False
Start = isReachable (3, 15) (58, 69) // False

