module ex_01

import StdEnv

isTriangle :: (Int, Int, Int) -> Bool
isTriangle (x, y, z) = ((ra ^ 2.0) + (rb ^ 2.0) == (rc ^ 2.0)) && (a + b > c)
where
    [a, b, c] = sort [x, y, z]
    
    [ra, rb, rc] = map toReal [a,b,c]

validTriangles :: [(Int, Int Int)] -> [Bool]
validTriangles ts = [isTriangle t \\ t <- ts]

integerInsertion :: Int Int -> Int
integerInsertion x y = toInt {c \\ c <-: flatten}
where
    flattened = flatten [[cx, cy] \\ cx <-: (toString x) & cy <-: (toString y)]


group_by_marks :: [(String, Int)] Int -> ([(String, Int)], [(String, Int)])
group_by_marks ts threshold = (group_p, group_f)
where
    group_p :: [(String, Int)]
    group_p = [(n, s) \\ (n, s) <- ts | s >= threshold ]

    group_f :: [(String, Int)]
    group_f = [(n, s) \\ (n, s) <- ts | s < threshold ]