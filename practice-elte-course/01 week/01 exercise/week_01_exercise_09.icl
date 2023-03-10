module week_01_exercise_09
import StdEnv

// 9. Change a character if is small letter to uppercase and vice versa,
// if is a special sign, leave as it is.
ch :: Char -> Char
ch c = toUpper c 
//Start = (ch 'a', ch 'z', ch 'A', ch 'Z', ch 'x', ch '%') // ('A','Z','a','z','X','%')