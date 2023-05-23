module pt_extra

import StdEnv
// NEPTUNE: B9XP3X

/* -1
//Write a function that takes a list of lists
// and returns the biggest even sum of the sublists' sums
// example: [[1,2,3],[],[10,1],[2,2]] -> 6 because the sum
// of [1,2,3] is 6 and it is the biggest even between the other sums
// 0, 11 and 4
// Note: sum of an empty list is 0
// Note: if there are no even sums, return -1
*/

max_even_sum :: [[Int]] -> Int
max_even_sum    lls
| candidates == []      => -1
| otherwise             => maxList candidates
where
    candidates :: [Int]
    candidates =  [sum ls \\ ls <- lls | ((sum ls) rem 2) == 0]

//Start = max_even_sum [[1,2,3],[],[10,1],[2,2]] //6
//Start = max_even_sum [[1,1], [9,9], [100,1]] //18
//Start = max_even_sum [[],[1]] //0
//Start = max_even_sum [[1],[3,4]] //-1


:: Major = Finance | CS | Math | Physics | Economy | Linguistics
:: Course = {name::String, major::Major, credits::Int}

OOP::Course
OOP = {name="OOP",major=CS, credits=5}
Discrete_math::Course
Discrete_math = {name="Discrete_math",major=Math, credits=4}
Relativity::Course
Relativity = {name="Relativity", major=Physics, credits=6}
Functional::Course
Functional = {name="Functional", major=CS, credits=5}
Quantum_mechanics::Course
Quantum_mechanics = {name="Quantum_mechanics", major=Physics, credits=4}
Corporate_finance::Course
Corporate_finance = {name="Corporate_finance", major=Finance, credits=6}
Venture_captical::Course
Venture_captical = {name="Venture_captical", major=Finance, credits=6}
Macroeconomics::Course
Macroeconomics = {name="Macroeconomics", major=Economy, credits=6}
Microeconomics::Course
Microeconomics = {name="Microeconomics", major=Economy, credits=6}
Numerical_Methods::Course
Numerical_Methods = {name="Numerical_Methods", major=Math, credits=4}
Cryptography::Course
Cryptography = {name="Cryptography", major=CS, credits=2}
Phonology::Course
Phonology = {name="Phonology", major=Linguistics, credits=3}
Morphology::Course
Morphology = {name="Morphology", major=Linguistics, credits=3}

/*
2.Given a list of Courses and a major, check if any of the courses in the list
has the same major with the given one, return True if there is at least one.
*/


instance == Major
where
    (==) Finance Finance = True
    (==) CS CS = True
    (==) Math Math = True
    (==) Physics Physics = True
    (==) Economy Economy = True
    (==) Linguistics Linguistics = True
    (==) _  _ = False


same_major :: [Course] Major -> Bool
same_major    courses  m     => or [m == major \\ {major} <- courses]

//Start = same_major [Corporate_finance, OOP, Microeconomics] Finance // True
//Start = same_major [Morphology, Macroeconomics, Quantum_mechanics] CS // False
//Start = same_major [Venture_captical, Relativity, Cryptography] Physics // True
//Start = same_major [Discrete_math] Economy // False
//Start = same_major [] Physics // False
