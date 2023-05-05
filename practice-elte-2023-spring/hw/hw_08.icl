module hw_08
import StdEnv

// NEPTUN: B9XP3X

/* 1-
Given an integer number and a binary tree of integers, check if there are two elements in the tree whose
sum is equal to the given integer value.
*/


// Examples
:: Tree a = Node a (Tree a) (Tree a)
          | Leaf

// Tree1 see link: http://graphonline.ru/en/?graph=RDODcKkbEjpzIbIh
Tree1 :: Tree Int
Tree1 = Node 7 Leaf Leaf

// Tree2 see link: http://graphonline.ru/en/?graph=apYgfCbqYeaQRHNL
Tree2 :: Tree Int
Tree2 = Node 0 (Node 1 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf))  (Node 2 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf))
//Start = Tree2

// Tree3 see link: http://graphonline.ru/en/?graph=YMMkGtZycajcoXEU
Tree3 :: Tree Int
Tree3 = Node 0 (Node 1 (Node 3 Leaf (Node 8 Leaf Leaf)) Leaf)  (Node 2 Leaf Leaf)


flattenTree :: (Tree a)     	-> [a]
flattenTree    Leaf         	=  []
flattenTree    (Node a ln rn)	=  [a]  ++ (flattenTree ln) ++ (flattenTree rn)

check :: (Tree Int) Int -> Bool
check    tree       n   =  [n \\ x <- (flattenTree tree) , y <- (flattenTree tree) | x + y == n] <> []

//Start = check Tree3 11 // True
//Start = check Tree3 10 // True
//Start = check Tree3 1 // True
//Start = check Tree2 6 // True
//Start = check Tree1 6 // False




:: Major = CS | Math | Physics

:: Course = {name::String, major :: Major, credits:: Int}



Programming::Course

Programming = {name="Programming",major=CS, credits =5}

Analysis::Course

Analysis = {name="Analysis",major=Math, credits =4}

Relativity::Course

Relativity = {name="Relativity",major=Physics,credits=6}

Functional::Course

Functional = {name="Functional",major=CS,credits=5}

Basic::Course

Basic = {name="Basic",major=Math,credits=3}

Thermo_Dynamics::Course

Thermo_Dynamics = {name="Thermo_Dynamics",major=Physics,credits=4}

Astronomy::Course

Astronomy = {name="Astronomy",major=Physics,credits=6}

Numerical_Methods::Course

Numerical_Methods = {name="Numerical_Methods",major=Math,credits=4}

Compilers::Course

Compilers = {name="Compilers",major=CS,credits=4}



treea = (Node Functional (Node Astronomy (Node Programming (Node Astronomy Leaf Leaf) (Node Thermo_Dynamics Leaf Leaf)) Leaf) (Node Basic (Node Compilers (Node Relativity Leaf Leaf) (Node Astronomy (Node Analysis Leaf Leaf) Leaf)) Leaf))

treeb = (Node Functional (Node Astronomy (Node Programming (Node Astronomy Leaf Leaf) Leaf) Leaf) (Node Relativity (Node Compilers (Node Numerical_Methods Leaf Leaf) (Node Astronomy (Node Analysis Leaf Leaf) Leaf)) Leaf))

treec = (Node Analysis Leaf (Node Programming Leaf (Node Astronomy Leaf (Node Basic Leaf (Node Compilers Leaf (Node Thermo_Dynamics Leaf (Node Numerical_Methods Leaf (Node Functional Leaf Leaf))))))))



/*
2. Given a tree of Courses, give back all the CS Courses
whose both children are either Physics courses or Leaf-s.
*/

isPhysics :: Course             -> Bool
isPhysics    {major=Physics}    =  True
isPhysics    _                  =  False

isCS :: Course      -> Bool
isCS    {major=CS}  =  True
isCS    _           =  False

isLeafOrPhysics :: (Tree Course)	-> Bool
isLeafOrPhysics    Leaf         	=  True
isLeafOrPhysics    (Node c _ _) 	=  isPhysics c


getphysics :: (Tree Course)     -> [Course]
getphysics    Leaf                                          =  []
getphysics    (Node c ln rn)
| isCS c && isLeafOrPhysics ln && isLeafOrPhysics rn    =  [c] ++ (getphysics ln) ++ (getphysics rn)
| otherwise                                                 =  (getphysics ln) ++ (getphysics rn)



//Start = getphysics treea // [(Course "Programming" CS 5),(Course "Compilers" CS 4)]

//Start = getphysics treeb // [(Course "Functional" CS 5),(Course "Programming" CS 5)]

//Start = getphysics treec // [(Course "Programming" CS 5),(Course "Compilers" CS 4),(Course "Functional" CS 5)]