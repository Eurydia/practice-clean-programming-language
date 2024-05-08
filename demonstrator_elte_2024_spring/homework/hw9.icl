module hw9
import StdEnv

// (BEGIN FIXED)
// NEPTUN code: yyyyyy
// Please do not modify the code between "(BEGIN FIXED)" and "(END FIXED)" but feel free to add or remove everything else.
// Only ".icl" file format will marked and the file name should be "hw9.icl".
// Please comment out all "Start" and ensure that there is no compilation error or runtime error before submission.
// Partial solutions will marked, but only if it does not contain error.
// (END FIXED)

/* Task 1/1
James wants to throw a party where at least two friends of his friends attends, while he is planning to send the invitations, he encounters a problem.

Each friend has another friend they're really close to. James needs to send out invitations to his friends, but James's friend will only come if both the friend and their bestie receive an invite.

James needs to figure out the minimum number of invitations he has to send so that he can guarantee at least two friends will show up at the party.


Example:

  [3,1,2,5,4]

  The first friend will come if they and the third friend are invited.
  The second friend will only come if they and the first friend are invited.
  The third friend will only come if they and the second friend are invited.
  And so on.

While James can send five invitations and guarantee that all of his friend will joins the party, 
he only needs to send two; one for the fourth and one for the fifth.
*/

// miniummInvitations :: {Int} -> Int


//Start = miniummInvitations {1,2} // Expected: 2
//Start = miniummInvitations {2, 3, 1} // Expected: 3
//Start = miniummInvitations {3, 1, 2} // Expected: 3
//Start = miniummInvitations {2, 1, 4, 3} // Expected: 2
//Start = miniummInvitations {2, 3, 4, 1} // Expected: 3
//Start = miniummInvitations {2, 4, 1, 3} // Expected: 3
//Start = miniummInvitations {3, 1, 4, 2} // Expected: 3
//Start = miniummInvitations {3, 4, 5, 1, 2} // Expected: 3
//Start = miniummInvitations {3, 5, 4, 2, 1} // Expected: 3
//Start = miniummInvitations {5, 4, 1, 2, 3} // Expected: 3
