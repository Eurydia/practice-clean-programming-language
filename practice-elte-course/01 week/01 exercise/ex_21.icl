module ex_21
import StdEnv

//21. Given two integers, put their digits together like: 123 456 =123456
glue :: Int Int -> Int 
glue a b = (a * 1000) + b

//Start = glue 123000 456 // 123000456
//Start = glue 765 432 // 765432

//glue2 :: Int Int -> Int

//Start = glue2 123000 456 // 123000456
//Start = glue2 765 432 // 765432