module pt_08

import StdEnv

// NEPTUN: B9XP3X


:: Tree a = Node a (Tree a) (Tree a)
| Leaf

/*
Given a binary tree of integers, check for each node wheather the following property holds or not:
sum of the elements of its left sub-tree is greater than the root
AND
sum of the elements of its right sub-tree is less than the root.
A sub tree whose both children are leafs should return true;
Otherwise Consider Leaf to be 0;
Example:
10
/ \
2 3
/ \ / \
9 -7 6 -5
/ \ / \/ \ / \
10 LL LL LL -7
/\ /\
L L L L
That tree given returns TRUE because each node has sum of elements of its left sub-tree > root
and
has sum of elements of its right sub-tree < root.
*/

treeOne = Node 1 (Node 6 (Node 7 Leaf Leaf) (Node 0 (Node 1 Leaf Leaf) (Node -1 Leaf Leaf))) Leaf
treeTwo = Node 10 (Node 2 (Node 9 (Node 10 Leaf Leaf) Leaf ) (Node -7 Leaf Leaf) ) (Node 3 (Node 6 Leaf Leaf) (Node -5 Leaf (Node -7 Leaf Leaf)))
treeThree = Node 10 (Node 2 (Node 4 (Node 8 Leaf Leaf) Leaf) (Node 7 (Node -8 Leaf Leaf) Leaf)) (Node 3 (Node 6 Leaf Leaf) (Node 5 Leaf (Node 2 Leaf Leaf)))

// Helper
isLeaf :: (Tree Int) -> Bool
isLeaf Leaf = True
isLeaf _ = False

sumTree :: (Tree Int) -> Int
sumTree    (Leaf)     =  0
sumTree    (Node x fstChild sndChild) = x + (sumTree fstChild) + (sumTree sndChild)
 

PT7 :: (Tree Int) 						 -> Bool
PT7    (Leaf)     						 =  True
PT7    (Node _ (Leaf) (Leaf))            =  True
PT7    (Node root fstChild sndChild)     =  (sumTree fstChild > root) && (sumTree sndChild < root) && (PT7 fstChild) && (PT7 sndChild)

//Start = PT7 treeOne // True
//Start = PT7 treeTwo // True
Start = PT7 treeThree // False
