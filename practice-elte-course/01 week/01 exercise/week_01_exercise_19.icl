module week_01_exercise_19
import StdEnv

// 19. Use 18. to write a function that squares its argument.
sq :: Int -> Int
sq n = powerrec n 2

//Start = sq 8 // 64
//Start = sq 0 // 0