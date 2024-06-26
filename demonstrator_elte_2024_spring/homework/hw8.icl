module hw8
import StdEnv

// (BEGIN FIXED)
// NEPTUN code: yyyyyy
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)" but feel free to add or remove everything else.
// Only ".icl" file format will marked and the file name should be "hw8.icl".
// Please comment out all "Start" and ensure that there is no compilation error or runtime error before submission.
// Partial solutions will marked, but only if it does not contain error.
// (END FIXED)

// Task 1/2
// Given a binary tree, implement a function which sum the nodes with only one leaf.
// EDIT: To clarify, the function should count the sum of nodes which has exactly one leaf as its direct children.

// (BEGIN FIXED)
:: Tree a = Node a (Tree a) (Tree a) | Leaf

tree1 :: Tree Int
tree1 = (Node 4 (Node 10 (Node 6 Leaf Leaf) (Node 11 Leaf Leaf)) (Node 20 (Node 12 Leaf Leaf) Leaf))

tree2 :: Tree Int
tree2 = (Node 5 (Node 10 (Node 31 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 17 (Node 31 (Node 14 (Node 12 Leaf Leaf) Leaf) Leaf) (Node 11 Leaf Leaf) ))

tree3 :: Tree Int
tree3 = (Node 12 (Node 11 (Node 11 (Node 32 Leaf Leaf) Leaf) Leaf) (Node 4 (Node 17 (Node 5 (Node 7 Leaf Leaf) Leaf) Leaf) (Node 3 Leaf (Node 4 Leaf Leaf)) ))

tree4 :: Tree Int
tree4 = (Node 7 (Node 6 tree1 tree2) (Node 5 tree3 tree2))

tree5 :: Tree Int
tree5 = Node 1 tree3 tree4
// (END FIXED)

// (BEGIN FIXED)
//leavesSum :: (Tree Int) -> Int
// (END FIXED)

// SAMPLE SOLUTION
leavesSum :: (Tree Int)       	-> Int
leavesSum    Leaf             	=  0
leavesSum    (Node x Leaf Leaf) =  0
leavesSum    (Node x Leaf r)  	=  x + (leavesSum r)
leavesSum    (Node x l Leaf)  	=  x + (leavesSum l)
leavesSum    (Node x l r)     	=  (leavesSum l) + (leavesSum r)

//Start = leavesSum tree1 // Expected: 20
//Start = leavesSum tree2 // Expected: 86
//Start = leavesSum tree3 // Expected: 47
//Start = leavesSum tree4 // Expected: 239
//Start = leavesSum tree5 // Expected: 286


// Task 2/2
// Given an array of students, find the University which has the highest average of student average GPA.
// EDIT: If the there is no student from a particular university, then the student average GPA of that university is effectively 0.0.

// (BEGIN FIXED)
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
// (END FIXED)

// (BEGIN FIXED)
//highestAverageGPA :: {Student} -> University
// (END FIXED)

// SAMPLE SOLUTION
instance == University
where
  (==) ELTE ELTE = True
  (==) BME BME = True
  (==) Corvinus Corvinus = True
  (==) _ _ = False

UniGPA :: University {Student} -> Real
UniGPA    u          ls
| isEmpty rStudents 			= 0.0
| otherwise   					= avg [avg (map toReal grades) \\ {grades, uni} <- rStudents]
where
	rStudents :: [Student]
	rStudents =  [s \\ s <-: ls | s.uni == u]
	
sortByScore :: (University, Real) (University, Real) -> Bool
sortByScore    (_, l) (_, r)                         = l > r

highestAverageGPA :: {Student} -> University
highestAverageGPA    students  => fst (hd (sortBy sortByScore [(u, UniGPA u students) \\ u <- [ELTE,BME, Corvinus]]))

// (BEGIN FIXED)
//Start = highestAverageGPA {Rose,Harry,Isabella,Oliver,James,Noah,Lily,Peter,Eros} // ELTE
//Start = highestAverageGPA {Rose,Harry,Isabella} // BME
//Start = highestAverageGPA {Oliver, Noah,James,Lily} // ELTE
//Start = highestAverageGPA {Peter, Eros, Harry} // Corvinus
// (END FIXED)

