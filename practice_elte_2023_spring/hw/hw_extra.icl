

module hw_extra

import StdEnv

:: University = ELTE | BME | Corvinus
:: Student = {name::String, uni :: University, grades:: [Int]}


Rose::Student
Rose = {name="Rose",uni=ELTE, grades =[5,5,3,4,2,4,5,5]}
Peter::Student
Peter = {name="Peter",uni=BME, grades =[3,2,3,4,2,4,2,1,4,3,2,4]}
Noah::Student
Noah = {name="Noah",uni=Corvinus,grades=[1,2,2,3,1,3,4,2,3,4,2,4,2,1]}
James::Student
James = {name="James",uni=ELTE,grades=[5,5,5,5,3,4,5,4,5]}
Lily::Student
Lily = {name="Lily",uni=BME,grades=[1,2,1,3,1,5,3,3,4,1,3,1,5,1,1]}
Harry::Student
Harry = {name="Harry",uni=Corvinus,grades=[3,4,1,3,4,2,3,5,5]}
Eros::Student
Eros = {name="Eros",uni=Corvinus,grades=[4,2,4,4,4,4,4,5,2]}
Isabella::Student
Isabella = {name="Isabella",uni=BME,grades=[5,5,5,4,5,5,4,5,4,5]}
Oliver::Student
Oliver = {name="Oliver",uni=ELTE,grades=[2,3,3,4,3,2,1,3,2,3]}


/* 1.
Given an array of students, find the University which has the highest
average of student average GPA.


Example:
{Peter, Eros, Harry}
Peter's average GPA - 2.83
Eros's average GPA - 3.67
Harry's average GPA - 3.33


Hence:
ELTE's average grades - []
BME's average grades - [2.83]
Corvinus's average grades - [3.67, 3.33]


Corvinus has the highest average - 3.5
*/

instance == University
where
	(==) ELTE ELTE = True
	(==) Corvinus Corvinus = True
	(==) BME BME = True
	(==) _ _ = False

getUniAvg :: {Student} University -> Real
getUniAvg    students  u          
| stuAvg == []                    =  0.0
| otherwise                       =  avg stuAvg
where
	stuAvg :: [Real]
	stuAvg = [avg (map toReal grades) \\ {uni, grades} <-: students | uni == u] 


uniWithHighestAverage :: {Student} -> University
uniWithHighestAverage    students
| avgL !! 0 == maxAvg              =  ELTE
| avgL !! 1 == maxAvg              =  BME
| otherwise                        =  Corvinus 
where
    avgL :: [Real]
	avgL =  [getUniAvg students u \\ u <- [ELTE, BME, Corvinus]]

	maxAvg :: Real
	maxAvg =  maxList avgL

//Start = uniWithHighestAverage {Rose,Harry,Isabella,Oliver,James,Noah,Lily,Peter,Eros} // ELTE
//Start = uniWithHighestAverage {Rose,Harry,Isabella} // BME
//Start = uniWithHighestAverage {Oliver, Noah,James,Lily} // ELTE
//Start = uniWithHighestAverage {Peter, Eros, Harry} // Corvinus



/* 2

You are given a binary tree. Implement the

function that will cut nodes that have

a depth greater or equal to the given one.

For example, if you have a tree:

1 depth-0

/ \

2 3 depth-1

/ \

4 5 depth-2

/ \ / \

L L L L

And you cut it on 2, the result will be:

1 depth-0

/ \

2 3 depth-1

/ \ / \

L L L L



NOTE: "L" represents Leaf

*/




:: Tree a = Node a (Tree a) (Tree a) | Leaf

tree1 :: Tree Int
tree1 = (Node 4 (Node 10 (Node 6 Leaf Leaf)(Node 11 Leaf Leaf)) (Node 20 (Node 12 Leaf Leaf) Leaf))

tree2 :: Tree Int
tree2 = (Node 5 (Node 10 (Node 31 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 17 (Node 31 (Node 14 (Node 12 Leaf Leaf) Leaf) Leaf) (Node 11 Leaf Leaf) ))

tree3 :: Tree Int
tree3 = (Node 12 (Node 11 (Node 11 (Node 32 Leaf Leaf) Leaf) Leaf) (Node 4 (Node 17 (Node 5 (Node 7 Leaf Leaf) Leaf) Leaf) (Node 3 Leaf (Node 4 Leaf Leaf)) ))

tree4 :: Tree Int
tree4 = (Node 7 (Node 11 tree1 tree2) (Node 5 tree3 tree2))

tree5 :: Tree Int
tree5 = Node 1 tree3 tree4


cutTheTree :: (Tree a)     Int   -> (Tree a)
cutTheTree    (Leaf)       _     =  Leaf
cutTheTree    _            0     =  Leaf
cutTheTree    (Node x l r) depth
| depth < 0                      =  Leaf
| otherwise                      =  Node x (cutTheTree l (depth - 1)) (cutTheTree r (depth - 1))



//Start = cutTheTree tree1 2 // (Node 4 (Node 10 Leaf Leaf) (Node 20 Leaf Leaf))

//Start = cutTheTree tree1 1 // (Node 4 Leaf Leaf)

//Start = cutTheTree tree1 0 // Leaf

//Start = cutTheTree tree1 100 // (Node 4 (Node 10 (Node 6 Leaf Leaf) (Node 11 Leaf Leaf)) (Node 20 (Node 12 Leaf Leaf) Leaf))

//Start = cutTheTree tree5 5 // (Node 1 (Node 12 (Node 11 (Node 11 (Node 32 Leaf Leaf) Leaf) Leaf) (Node 4 (Node 17 (Node 5 Leaf Leaf) Leaf)

// (Node 3 Leaf (Node 4 Leaf Leaf)))) (Node 7 (Node 11 (Node 4 (Node 10 Leaf Leaf) (Node 20 Leaf Leaf)) (Node 5

// (Node 10 Leaf Leaf) (Node 17 Leaf Leaf))) (Node 5 (Node 12 (Node 11 Leaf Leaf) (Node 4 Leaf Leaf)) (Node 5 (Node 10 Leaf Leaf) (Node 17 Leaf Leaf))))) 