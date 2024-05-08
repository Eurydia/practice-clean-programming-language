module endterm
import StdEnv


:: Hospital = {hospitalName::String, patients::[Patient], doctors::[Doctor]}
:: Doctor = {name::String, specialty::String}
:: Patient = {patientName::String, age::Int, heartRates::{Int}, mostVisitedDoctor::Doctor}

GeneralHospital::Hospital
GeneralHospital={ hospitalName="General Hospital", patients=[Alice, Bob, Charlie], doctors=[DrSmith, DrJones]}

CityClinic::Hospital
CityClinic={ hospitalName="City Clinic", patients=[Diana, Eva], doctors=[DrBrown, DrWhite]}

HealthBridgeClinic::Hospital
HealthBridgeClinic={hospitalName="HealthBridge Clinic", patients=[Zoe, Liam, Mia, Noah], doctors=[DrGrey, DrBlack]}


DrSmith::Doctor
DrSmith={name="Dr. Smith", specialty="Cardiology"}

DrJones::Doctor
DrJones={name="Dr. Jones", specialty="Neurology"}

DrBrown::Doctor
DrBrown={name="Dr. Brown", specialty="Dermatology"}

DrWhite::Doctor
DrWhite={name="Dr. White", specialty="Orthopedics"}

DrGrey::Doctor
DrGrey={name="Dr. Grey", specialty="Pediatrics"}

DrBlack::Doctor
DrBlack={name="Dr. Black", specialty="General Practice"}


Alice::Patient
Alice={patientName="Alice", age=30, heartRates={72, 74, 73}, mostVisitedDoctor=DrSmith}

Bob::Patient
Bob={patientName="Bob", age=25, heartRates={68, 70, 69}, mostVisitedDoctor=DrJones}

Charlie::Patient
Charlie={patientName="Charlie", age=40, heartRates={66, 68, 67}, mostVisitedDoctor=DrSmith}

Diana::Patient
Diana={patientName="Diana", age=35, heartRates={75, 77, 76}, mostVisitedDoctor=DrWhite}

Eva::Patient
Eva={patientName="Eva", age=29, heartRates={71, 70, 72}, mostVisitedDoctor=DrBrown}

Zoe::Patient
Zoe={patientName="Zoe", age=22, heartRates={65, 67, 66}, mostVisitedDoctor=DrGrey}

Liam::Patient
Liam={patientName="Liam", age=24, heartRates={68, 69, 70}, mostVisitedDoctor=DrBlack}

Mia::Patient
Mia={patientName="Mia", age=28, heartRates={74, 72, 73}, mostVisitedDoctor=DrBlack}

Noah::Patient
Noah={patientName="Noah", age=32, heartRates={71, 69, 70}, mostVisitedDoctor=DrGrey}

/* Arrays
Given a string, define a function called validateUsername which returns True if the username is valid and False otherwise. The function should enforce the following rules:

    The username must contain only alphanumeric characters (letters a-z, digits 0-9, and underscore _).
    The username must be between 4 and 20 characters in length, inclusive.
    The username must not contain consecutive underscores ("__").
*/

/*
SAMPLE SOLUTION
---
hasConseqUnderscore :: [Char] -> Bool
hasConseqUnderscore    str    => or [a == '_' && b == '_' \\ a <- str & b <- (tl str)]

validateUsername :: String -> Bool
validateUsername    usr    => (4 <= (size usr)) && ((size usr) <= 20) && (not (hasConseqUnderscore lstUsr)) && (all isAlphanum (filter ((<>)'_') lstUsr))
where
  lstUsr :: [Char]
  lstUsr = [ch \\ ch <-: usr]
*/

// validateUsername :: String -> Bool

//Start = validateUsername "user123"     // Expected: True
//Start = validateUsername "user_name"   // Expected: True
//Start = validateUsername "___user"     // Expected: False
//Start = validateUsername "user__name"  // Expected: False
//Start = validateUsername "user"        // Expected: True
//Start = validateUsername "username1234567890123456789" // Expected: False
//Start = validateUsername "user123_"    // Expected: True
//Start = validateUsername "user__name_" // Expected: False


/* Record & Instance
Given an array of patients, write a function which sorts the array. The functions sorts the using their age first. If two patients have the same age, the patients sorted using on their name in alphabetical order.
*/

/*
SAMPLE SOLUTION
---
instance < Patient
where (<) left right = (left.age < right.age) || ((left.age == right.age) && (left.patientName < right.patientName))

sortPatients :: {Patient} -> {Patient}
sortPatients    items     = {item \\ item <- (sort lItems)}
where 
	lItems = [item \\ item <-: items]
*/

// sortPatients :: {Patients} -> {Patient}


//Start = sortPatients {Bob, Charlie, Diana, Alice} // Expected: {Bob, Alice, Diana, Charlie}
//Start = sortPatients {Eva, Diana, Charlie, Bob, Alice} // Expected:  {Bob, Eva, Alice, Diana, Charlie}
//Start = sortPatients {Bob, Eva, Diana, Charlie, Alice, Zoe} // Expected: {Zoe, Bob, Eva, Alice, Diana, Charlie}
//Start = sortPatients {Eva, Liam, Alice, Charlie, Bob, Diana, Zoe} // Expected: {Zoe, Liam, Bob, Eva, Alice, Diana, Charlie}
//Start = sortPatients {Mia, Eva, Alice, Diana, Liam, Zoe, Charlie, Bob} // Expected: {Zoe, Liam, Bob, Mia, Eva, Alice, Diana, Charlie}
//Start = sortPatients {Diana, Liam, Alice, Bob, Eva, Mia, Charlie, Noah} // Expected: {Liam, Bob, Mia, Eva, Alice, Noah, Diana, Charlie}
//Start = sortPatients {Mia, Liam, Alice, Noah, Eva, Charlie} // Expected: {Liam, Mia, Eva, Alice, Noah, Charlie}


/* Trees 
Given a binary tree, write a function which determines whether it is balanced or not. 
A binary tree is considered balanced if heights of each child of a node differs by at most one. 
A leaf is balanced by default.
*/

:: Tree = Node Tree Tree
        | Leaf
tree1 :: Tree
tree1 = (Node (Node (Node Leaf Leaf) (Node Leaf Leaf)) (Node (Node Leaf Leaf) Leaf))
tree2 :: Tree
tree2 = (Node (Node (Node (Node Leaf Leaf) Leaf) Leaf) (Node (Node (Node (Node Leaf Leaf) Leaf) Leaf) (Node Leaf Leaf) ))
tree3 :: Tree
tree3 = (Node (Node (Node (Node Leaf Leaf) Leaf) Leaf) (Node (Node (Node (Node Leaf Leaf) Leaf) Leaf) (Node Leaf (Node Leaf Leaf)) ))
tree4 :: Tree
tree4 = (Node (Node tree1 tree2) (Node tree3 tree2))
tree5 :: Tree
tree5 = Node tree3 tree4

/* 
SAMPLE SOLUTION
---
treeDepth :: Tree     -> Int
treeDepth    Leaf     =  1
treeDepth    (Node l r) =  1 + (max (treeDepth l) (treeDepth r))

isBalancedTree :: Tree     -> Bool
isBalancedTree    Leaf     =  True
isBalancedTree    (Node l r) =  (treeDepth l) == (treeDepth r) && (isBalancedTree l) && (isBalancedTree r)
*/

//isBalancedTree :: Tree -> Bool

//Start = isBalancedTree Leaf // Expected: True
//Start = isBalancedTree (Node Leaf Leaf) // Expected: True
//Start = isBalancedTree (Node (Node Leaf Leaf) (Node Leaf Leaf)) // Expected: True
//Start = isBalancedTree tree1 // Expected: False
//Start = isBalancedTree tree2 // Expected: False
//Start = isBalancedTree tree3 // Expected: False
//Start = isBalancedTree tree4 // Expected: False
//Start = isBalancedTree tree5 // Expected: False