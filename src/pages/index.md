---
layout: "@layouts/Layout.astro"
title: Cleanpedia
Last updated: April 15th, 2023

Revisions: 2
Data of last revision: 12 APR 2023
---

# Cleanpedia

## Table of contents

1. Introduction
2. Types
	1. Type specification
	2. Primitive types
		1. Integer
		2. Real numbers
		3. Characters
		4. Booleans
	3. Structured types
		1. Lists
		2. Arrays
		3. Tuples
3. Comprehensions
4. Functions
	1. Definitions
	2. Invocation
	3. Symbolic functions
	4. Lambda functions
5. Scoping
	1. Function-local definition
	2. Guard-local definition
6. Pattern matching
7. Appendix A: Built-in operations and functions
8. Appendix B: Error troubleshooting
9. Appendix C: CRU (Code Ready to Use)

## Introduction

My **motivation** is to create an accessible, concise, and clear documentation which can be used by those who wishes to learn Clean.

The same information can be found on:
- [Cloogle](https://cloogle.org/) which is the language's search engine, and
- [language report](https://cloogle.org/doc/) which describes the syntax and BNF of Clean.

## Types

Types define the kind of data used in a program and the operations that can be performed on it.
Correct usage is important for program functionality and efficiency.

Types can only interact with themselves due to lack of implicit type conversion.

### Type specification

#### Variable specification

**Syntax**

The syntax for specifying a variable type is shown below.

```
// Language: Clean

exVar :: T
```

Practically, variable specifications may look similar to the following:

```
// Language: Clean

width :: Int
width =  12

area :: Int
area =  width * width
```

**Possible error**

It is important to keep in mind that a variable declaration must immediately follow its type specification.

```
// Language: Clean

exInt :: Int

...code...

exInt =  12 // NOT OK :(
```

In this case, $\text{exInt}$ will cause a compilation error with a message which states:

```
Error [...]: function body expected.
```

To resolve the error, simply move the variable declaration up

```
// Language: Clean

exInt :: Int
exInt =  12  // OK

...code...
```

or move the type specification down.

```
// Language: Clean

...code...

exInt :: Int
exInt =  12  // OK
```

### Function specification

**Syntax**

The syntax for specifying a function type is shown below.

```
// Language: Clean

exFuncX :: T            -> K

exFuncY :: T K          -> V

exFuncZ :: T1 T2 ... Tn -> K
```

$\text{exFuncX}$ has one parameter of type $T$.
Its return type is $K$.

$\text{exFuncY}$ has two parameters.
The first parameters has type $T$, and the second of $K$.
Its return type is $V$.

 $\text{exFuncZ}$ has $n$ parameters.
 The $n$-th parameter has type $T_{n}$.

**Class context**

Class context ensures that operations are available on a generic type.

It has the following syntax:

```
// Language: Clean

exFuncX :: T   -> K | + T

exFuncY :: T K -> V | +, / T

exFuncZ :: T K -> V | + T & ^ K
```

In $\text{exFuncX}$, $+$ must be available on $T$.

In $\text{exFuncY}$, $+$ and $/$ must be available on $T$.

In $\text{exFuncZ}$, $+$ must be available on $T$ and $^\wedge$  must be available on $K$.

More context can be added by following the same pattern.

### Primitive types

#### Integers

**Type annotation**: $\text{Int}$

**Constructions**

There are four methods to construct an $\text{Int}$ literal:

- with decimal notation,

	```
	// Language: Clean
	
	exIntDec    :: Int
	exIntDec    =  1919
	// exIntDec =  191
	// exIntDec =  19
	```

- with octal notation: prefixing the numbers with $0$,

	```
	// Language: Clean
	
	exIntOct    :: Int
	exIntOct    =  03577 // decimal 1919
	// exIntOct =  0277  // decimal 191
	// exIntOct =  023   // decimal 19
	```

- with hexadecimal notation: prefixing the numbers with $0\text{x}$, and

	```
	// Language: Clean
	
	exIntHex    :: Int
	exIntHex    =  0x77f // decinal 1919
	// exIntHex =  0xBF  // decimal 191
	// exIntHex =  0x13  // decimal 19
	```

 - with scientific notation.

	```
	// Language: Clean
	
	exIntSci    :: Int
	exIntSci    =  1.919E3 // 1919
	// exIntSci =  1.91E2  // 191
	// exIntSci =  1.9E1   // 19
	```

When constructing an integer using scientific notation, it is possible to construct a real number instead.

```
// Language: Clean

maybeInt :: Int
maybeInt =  2E-2 // 0.02 :(
```

In such a case, a compilation error will be thrown with a message which states:

```
Type error [...]: cannot unify demanded type with offered type:
Int
Real
```

To resolve this issue, ensure that an integer is constructed.

**Operations**:
- arithmetic operations,
- relational operations,
- bitwise operations, and
- standard methods.

**Type conversions**

Using a built-in function, other types can be explicitly converted to $\text{Int}$.
It can convert the following types:

- $\text{Int}\rightarrow\text{Int}$: does nothing,

- $\text{Real}\rightarrow\text{Int}$: rounds the number, and

	```
	// Language: Clean
	
	toInt -2.7 // -3
	toInt -2.5 // -2
	toInt  2.4 //  2
	toInt  2.9 //  3
	```

- $\text{Char}\rightarrow\text{Int}$: converts the character to its ASCII value.

	```
	// Language: Clean
	
	toInt 'A' // 65
	toInt 'a' // 97
	toInt '1' // 49
	toInt '-' // 45
	```

#### Real numbers

**Type annotation**: $\text{Real}$

**Constructions**

There are two methods to construct a $\text{Real}$ literal:

- using decimal notation, and

	```
	// Language: Clean
	
	exRealDec    :: Real
	exRealDec    =   1.919
	// exRealDec =  -1.91
	// exRealDec =  19.1
	```

- using scientific notation.

	```
	// Language: Clean
	
	exRealSci    :: Real
	exRealSci    =  1919E-4 //  0.1919
	// exRealSci = -191E-2  // -1.91
	// exRealSci =  19E-3   //  0.019
	```

$\text{Real}$ literals cannot be constructed using octal or hexadecimal notation.

**Operations**:
- arithmetic operations,
- relational operations,
- standard methods, and
- trigonometic methods.

**Type conversions**

Using a built-in function, other types can be explicitly converted to $\text{Real}$.
It can convert the following types:

- $\text{Real}\rightarrow\text{Real}$: does nothing,

- $\text{Int}\rightarrow\text{Real}$ and,

	```
	// Language: Clean
	
	toReal  19  //   19.0
	toReal -191 // -191.0
	```
	
- $\text{\{Char\}}\rightarrow\text{Real}$: converts the string to a real number.

	```
	// Language: Clean
	
	toReal "-19.1"  // -19.1
	toReal "+19.1"  //  19.1
	toReal "191"    // 191.0
	toReal "191.0"  // 191.0
	```

#### Characters

**Type annotation**: $\text{Char}$

**Construction**

There is only one method to construct a $\text{Char}$ literal:

```
// Language: Clean

exChar    :: Char
exChar    =  'a'
// exChar =  '9'
// exChar =  '+'
```

**Operations**:
- arithmetic operations,
- relational operations,
- standard methods, and
- validator methods.

**Type conversions** 

Using a built-in function, $\text{Int}$ can be explicitly converted to $\text{Char}$.

- $\text{Char}\rightarrow\text{Char}$: does nothing, and

- $\text{Int}\rightarrow\text{Char}$: converts the ASCII value to its character.

	```
	// Language: Clean
	
	toChar 49 // '1'
	toChar 89 // 'Y'
	toChar 35 // '#'
	toChar 16 // '►'
	```

#### Booleans

**Type annotation**: $\text{Bool}$

**Constructions**

There is one method to construct a $\text{Bool}$ literal:

```
// Language: Clean

exBool    :: Bool
exBool    =  True
// exBool =  False
```

**Operation**:
- logical operations.

**Explicit type conversion**: 

```
// Language: Clean

toBool :: Bool -> Bool    // does nothing
```

### Structured types

#### Lists

**Characteristics**:
- holds one type, and
- can have infinite length.

**Annotation**: $\text{[T]}$

**Constructions**:

```
// Language: Clean

A :: [Char] 
A =  ['a', 'b', 'c']            // individual elements

B :: [Char]
B =  ['a' : ['b', 'c']]         // from head and tail

C :: [Char]
C =  ['a' : ['b' : ['c' : []]]] 

D :: [Char] 
D =  ['abc']                    // shorthand for [Char] lists
```

**Operations**:
- [[#Lists: Standard operators]]
- [[#Lists: Relational operators]]
- [[#Lists: Methods]]
- [[#Lists: Manipulation methods]]
- [[#Lists: Set-like methods]]
- [[#Lists: Logical methods]]

#### Arrays

**Characteristcs**:
- holds one type, and
- has finite length.

**Annotation**: $\text{\{T\}}$

**Constructions**:

```
// Language: Clean

A :: {Char}
A =  {'a', 'b', 'c'}

B :: String
B =  "abc"             // also an array of characters
```

**Operations**:
- [[#Arrays: Standard operators]]
- [[#Arrays: Methods]]

#### Tuples

**Characteristcs**:
- can hold multiple type,
- must hold at least two items, and
- has finite length.

**Annotation**: $(\text{T}_{1}, ..., \text{T}_{n})$

**Constructions**:

```
// Language: Clean

A :: (Int, Char)
A =  (49, '1')

B :: (Real, Bool, String)
B =  (0.2, False, "Hi")

C :: (Int)
C =  (2, 6)                // NOT OK should be (Int, Int)
```

**Operations**:
-  [[#Tuples: Relational operators]]
- [[#Tuples: Methods]]

## Comprehensions

Both arrays and lists can be constructed with comprehension.
Use **$[...]$** to construct a list and **$\{...\}$** to construct an array.

```
// Language: Clean
A :: [T]
A =  [el \\ el <- list]                  // extract from a list

B :: [T]
B =  [el \\ el <-: array]                // extract from an array

C :: [(T, K)]
C =  [(x, y) \\ x <- xs , y <- ys]       // cartesian product

D :: [(T, K)]
D =  [(x, y) \\ x <- xs & y <- ys]       // pair-wise zip

F :: [T]
F =  [x \\ x <- xs | P x]                // same as filter

G :: [(T, K)]
G =  [(x, y) \\ x <- xs, y <- [1..x]]    // nested
```

## Functions

### Definition

A Syntax for function can be as minimal as shown below.

```
// Language: Clean

func_x :: T   -> K
func_x    ... =  ...
```

Conditional branches in functions can be defined as shown below.

```
// Language: Clean

// using guards

func_y :: Int Int -> Int
func_y    x   y
| y == 0          = abort "Division by zero"
| otherwise       = x / y

// using patterns

func_z :: Int Int -> Int
func_z    _   0   =  abort "Division by zero"
func_z    x   y   =  x / y 
```

### Invocation

Invoking a function in Clean differs slightly from traditional languages.

In traditional languages, such as Python, a pair of parentheses is used to **invoke** a function.
They can be omitted entirely.

```
// Language: Clean

f argA ... argZ
```

### Symbolic functions

By using prentheses, special symbols can be used as function names . 

```
// Language: Clean

(^^) :: T K -> V
```

Any function can be converted into an operator.
However, it must have an arity of exactly two.

```
// Language: Clean

(^^) infix  0 :: T K -> V

(^^) infixl 0 :: T K -> V  // left-associated

(^^) infixr 0 :: T K -> V  // right-associated
```

The $\text {infix}$ macros allows the function to be place between its arguments.

The number succeeding the macro represents the precedence from $0$ to $9$.
Higher precedence means the operator binds more tightly to its arguments.

``` 
// Language: Clean

A ^^ B   // invoked as operator

(^^) A B // invoked as regular function
```

### Lambda functions

The basic syntax for lambda function is shown below.

```
// Language: Clean

\(paramA, ..., paramZ) = ...
```

Conditional branches is also supported by lambda functions using `case ... of` expression.

```
// Language: Clean

\(x, y, z) = case x of 
3 -> y
_ -> z
```

## Scoping

There are two levels of local definitions:

### Function-local definitions 

Using **$\text{where}$** keyword, functions and variables can be scoped to a function.

```
// Language: Clean

func_x :: T   -> K
func_x    ... =  ...
where
	...
```

### Guard-local definitions 

Using **$\text{with}$** keyword, functions and variables can be scoped to guards of a function.

```
// Language: Clean

func_y :: T   -> K
func_y    ... =  ...
| ... = ...
with
	...
| otherwise = ...
```

## Pattern matching

Destructing an iterator can be done using **$\text{x , y}$** and **$\text{x : rest}$** pattern.

```
// Language: Clean

func_x :: [T]       -> K
func_x    [x, y, z] =  ...

func_x [3, 5 ,6]       // x=3; y=5; z=6
func_x [1, 2]          // run-time error
func_x [3, 5, 6, 7]    // run-time error
```

Without the greedy operator, the pattern must be an exact match, otherwise a run-time error is thrown.

```
// Language: Clean

func_y :: [T]      -> K
func_y    [x : rest] =  ...

func_y [3, 5, 6]   // x=3; rest=[5, 6]
func_y [1]         // x=1; rest=[]
func_y []          // run-time error
```

Attempting to destucture an empty iterator will thrown a run-time error.
To avoid this pitfall, a function pattern should defined.

```
// Language: Clean

func_y :: [T]      -> K
func_y    []       =  ...
func_y    [x : rest] =  ...

func_y [3, 5, 6]   // x=3; rest=[5, 6]
func_y [1]         // x=1; rest=[]
func_y []          // destructuring did not occur
                   // and no error is thrown
```

A complex destructuring pattern can be done as follow:

```
// Language: Clean

func_z :: [T]      -> K
func_z    [x, y : rest] =  ...

func_y [1, 2, 3, 4] // x=1; y=2; rest=[3, 4]
func_y [3, 5, 6]    // x=3; y=5; rest=[6]
func_y [1]          // run-time error
```

## Appendix A: Built-in operations and functions

This part will be referred to by other parts of the reference to increase readability and clarity.

It should be accepted that operators must return the same type as their arguments, except relational operators.

Simply put, operators must have one of the following signatures:
- $T\rightarrow T$, or
- $T\rightarrow T\rightarrow T$.

### $\text{Int}$ built-ins

#### Arithmetic operations

| Operator               | Meaning            |
| ---------------------- | ------------------ |
| <nobr>`-X`</nobr>      | Negation           |
| <nobr>`X + Y`</nobr>   | Addition           |
| <nobr>`X - Y`</nobr>   | Substraction       |
| <nobr>`X * Y`</nobr>   | Multiplication     |
| <nobr>`X / Y`</nobr>   | Floor division     |
| <nobr>`X ^ Y`</nobr>   | Exponentiation[^1] |
| <nobr>`X rem Y`</nobr> | Modulus            |

[^1]: It will throw a run-time error when invoked with a negative power.

Definitions: 
- $X, Y$ are integers.

#### Relational operations

| Operator                                 | Meaning                  |
| ---------------------------------------- | ------------------------ |
| <nobr>`X == Y`</nobr>                    | Equals to                |
| <nobr><code>X &#60;&#62; Y</code></nobr> | Not equal to             |
| <nobr><code>X &#62; Y</code></nobr>       | Greater than             |
| <nobr><code>X &#60; Y</code></nobr>       | Less than                |
| <nobr><code>X &#62; Y</code></nobr>       | Greater than or equal to |
| <nobr><code>X &#60;= Y</code></nobr>      | Less than or equal to    |

Definitions: 
- $X, Y$ are integers.

#### Bitwise operations

| Operator                                 | Meaning                     |
| ---------------------------------------- | --------------------------- |
| <nobr>`bitnot X`</nobr>                  | Bit inversion               |
| <nobr>`X bitor Y`</nobr>                 | Bitwise OR                  |
| <nobr>`X bitand Y`</nobr>                | Bitwise AND                 |
| <nobr>`X bitxor Y`</nobr>                | Bitwise XOR                 |
| <nobr><code>X &#60;&#60; Y</code></nobr> | Left shift $X$ by $Y$ bits  |
| <nobr><code>X &#62;&#62; Y</code></nobr> | right shift $X$ by $Y$ bits |

Definitions: 
- $X, Y$ are integers.

#### Standard methods

| Name                    | Meaning               | Signature                      |
| ----------------------- | --------------------- | ------------------------------ |
| <nobr>`sign X `</nobr>  | Signum of $X$         | <nobr> `Int -> Int`</nobr>     |
| <nobr>`abs X`</nobr>    | Absolute value of $X$ | <nobr> `Int -> Int`</nobr>     |
| <nobr>`gcd X Y`</nobr>  | GCD of $X$ and $Y$    | <nobr> `Int Int -> Int`</nobr> |
| <nobr>`lcm X Y`</nobr>  | LCM of $X$ and $Y$    | <nobr> `Int Int -> Int`</nobr> |
| <nobr>`isEven X`</nobr> | Even check on $X$     | <nobr> `Int -> Bool`</nobr>    |
| <nobr>`isOdd X`</nobr>  | Odd check on $X$      | <nobr> `Int -> Bool`</nobr>    |

Definitions: 
- $X, Y$ are integers.

---

### $\text{Real}$ built-ins

#### Arithmetic operations

| Operator             | Meaning            |
| -------------------- | ------------------ |
| <nobr>`-X`</nobr>    | Negation           |
| <nobr>`X + Y`</nobr> | Addition           |
| <nobr>`X - Y`</nobr> | Substraction       |
| <nobr>`X * Y`</nobr> | Multiplication     |
| <nobr>`X / Y`</nobr> | Division           |
| <nobr>`X ^ Y`</nobr> | Exponentiation[^2] |

[^2]: Unlike integers, it will not throw a run-time error when invoked with a negative power.

Definitions: 
- $X, Y$ are real numbers.

#### Relational operations

| Operator                                 | Meaning                  |
| ---------------------------------------- | ------------------------ |
| <nobr>`X == Y`</nobr>                    | Equals to                |
| <nobr><code>X &#60;&#62; Y</code></nobr> | Not equal to             |
| <nobr><code>X &#62; Y</code></nobr>       | Greater than             |
| <nobr><code>X &#60; Y</code></nobr>       | Less than                |
| <nobr><code>X &#62; Y</code></nobr>       | Greater than or equal to |
| <nobr><code>X &#60;= Y</code></nobr>      | Less than or equal to    |

Definitions: 
- $X, Y$ are integers

#### Standard methods

| Name                    | Meaning                 | Signature                   |
| ----------------------- | ----------------------- | --------------------------- |
| <nobr>`sign X`</nobr>   | Signum of $X$           | <nobr>`Real -> Int`</nobr>  |
| <nobr>`entier X`</nobr> | Floor of $X$            | <nobr>`Real -> Int`</nobr>  |
| <nobr>`abs X`</nobr>    | Absolute value of $X$   | <nobr>`Real -> Real`</nobr> |
| <nobr>`ln X`</nobr>     | Natural log of $X$      | <nobr>`Real -> Real`</nobr> |
| <nobr>`log10 X`</nobr>  | Log base 10 of $X$      | <nobr>`Real -> Real`</nobr> |
| <nobr>`exp X`</nobr>    | $e$ to the power of $X$ | <nobr>`Real -> Real`</nobr> |
| <nobr>`sqrt X`</nobr>   | Square root of $X$      | <nobr>`Real -> Real`</nobr> |

Definitions: 
- $X$ is a real number.

#### Trigonometic methods

The methods below have the same $\text {Real}\rightarrow\text {Real}$ signature.

| Name                   | Meaning              |
| ---------------------- | -------------------- |
| <nobr>`sin X`</nobr>   | $\sin X$             |
| <nobr>`cos X`</nobr>   | $\cos X$             |
| <nobr>`tan X`</nobr>   | $\tan X$             |
| <nobr>`asin X`</nobr>  | $\arcsin X$          |
| <nobr>`acos X`</nobr>  | $\arccos X$          |
| <nobr>`atan X`</nobr>  | $\arctan X$          |
| <nobr>`sinh X`</nobr>  | $\sinh X$            |
| <nobr>`cosh X`</nobr>  | $\cosh X$            |
| <nobr>`tanh X`</nobr>  | $\tanh X$            |
| <nobr>`asinh X`</nobr> | $\text {arcsinh} X$ |
| <nobr>`acosh X`</nobr> | $\text {arccosh} X$ |
| <nobr>`atanh X`</nobr> | $\text {arctanh} X$ |

Definitions: 
- $X$ is a real number.

---

### $\text{Char}$ built-ins

#### Arithmetic operations

| Operator             | Meaning     | Example                            |
| -------------------- | ----------- | ---------------------------------- |
| <nobr>`X + Y`</nobr> | Addition    | `'#' (35)  + '$' (36) -> 'G' (71)` |
| <nobr>`X - Y`</nobr> | Subtraction | `'d' (100) - '#' (35) -> 'A' (65)` |

Definitions: 
- $X, Y$ are characters.

#### Relational operations

| Operator                                 | Meaning                  |
| ---------------------------------------- | ------------------------ |
| <nobr>`X == Y`</nobr>                    | Equals to                |
| <nobr><code>X &#60;&#62; Y</code></nobr> | Not equal to             |
| <nobr><code>X &#62; Y</code></nobr>       | Greater than             |
| <nobr><code>X &#60; Y</code></nobr>       | Less than                |
| <nobr><code>X &#62; Y</code></nobr>       | Greater than or equal to |
| <nobr><code>X &#60;= Y</code></nobr>      | Less than or equal to    |

Definitions: 
- $X, Y$ are characters.

#### Standard methods

The following methods have the same $\text {Char}\rightarrow\text {Char}$ signature.

| Name                     | Meaning           |
| ------------------------ | ----------------- |
| <nobr>`toLower X`</nobr> | Lower case of $X$ |
| <nobr>`toUpper X`</nobr> | Upper case of $X$ |

Definitions: 
- $X$ are characters.

#### Validator methods

The following methods share the same $\text {Char}\rightarrow\text {Bool}$ signature.

| Name                        | Meaning                                       |
| --------------------------- | --------------------------------------------- |
| <nobr>`isLower X`</nobr>    | Lower case check on $X$                       |
| <nobr>`isUpper X`</nobr>    | Upper case check on $X$                       |
| <nobr>`isAlphanum X`</nobr> | Alphanumeric check on $X$                     |
| <nobr>`isAlpha X`</nobr>    | Alphabet check on $X$                         |
| <nobr>`isDigit X`</nobr>    | Digit check on $X$                            |
| <nobr>`isOctDigit X`</nobr> | Octal digit check on $X$                      |
| <nobr>`isHexDigit X`</nobr> | Hexadecimal digit check on $X$                |
| <nobr>`isAscii X`</nobr>    | Ascii check on $X$                            |
| <nobr>`isControl X`</nobr>  | Control Character check on $X$                |
| <nobr>`isPrint X`</nobr>    | Printibilty check on $X$                      |
| <nobr>`isSpace X`</nobr>    | `\t`, `\n`, `\r`, `\f`, and `\v` check on $X$ |

Definitions: 
- $X$ is a character.

---

### $\text{Bool}$ built-ins

#### Logical operators

| Operator                                   | Meaning          |
| ------------------------------------------ | ---------------- |
| <nobr>`not X`</nobr>                       | Logical Negation |
| <nobr><code>X &amp;&amp; Y</code></nobr>   | Logical AND      |
| <nobr><code>X &#124;&#124; Y</code></nobr> | Logical OR       |

Definitions: 
- $X, Y$ are booleans.

---

### $\text{[T]}$ built-ins

#### Standard operators

| Operators                 | Meaning                               |
| ------------------------- | ------------------------------------- |
| <nobr>`X !! i`</nobr>     | $i$-th element of $X$[^3]             |
| <nobr>`X ++ Y`</nobr>     | Append $Y$ to $X$                     |
| <nobr>`X % (i, j)`</nobr> | Slice $X$ from $i$ to $j$ (inclusive) |

Definitions:
- $X, Y$ are lists, and
- $i, j$ are integers.

[^3]: It will throw a run-time error if index is out of range.
Negative indexing is not allowed.

#### Relational operators

| Operator                                 | Meaning                  |
| ---------------------------------------- | ------------------------ |
| <nobr>`X == Y`</nobr>                    | Equals to                |
| <nobr><code>X &#60;&#62; Y</code></nobr> | Not equal to             |
| <nobr><code>X &#62; Y</code></nobr>       | Greater than             |
| <nobr><code>X &#60; Y</code></nobr>       | Less than                |
| <nobr><code>X &#62; Y</code></nobr>       | Greater than or equal to |
| <nobr><code>X &#60;= Y</code></nobr>      | Less than or equal to    |

Definitions:
- $X, Y$ are lists.

#### Standard methods

The stardard list methods are as follow:

| Name                       | Meaning                                   | Signature                                             |
| -------------------------- | ----------------------------------------- | ----------------------------------------------------- |
| <nobr>`reverse X`</nobr>   | Reveresed of $X$                          | <nobr>`[T] -> [T]`</nobr>                             |
| <nobr>`length X`</nobr>    | Length of $X$                             | <nobr>`[T] -> Int`</nobr>                             |
| <nobr>`sum X`</nobr>       | Sum of $X$                                | <nobr><code>[T] -> T &#124; zero, + T</code></nobr>   |
| <nobr>`prod X`</nobr>      | Product of $X$                            | <nobr><code>[T] -> T &#124; one, * T</code></nobr>    |
| <nobr>`avg X`</nobr>       | Average of $X$[^4]                        | <nobr><code>[T] -> T &#124; IncDec, / T</code></nobr> |
| <nobr>`flatten X`</nobr>   | Flattened $X$                             | <nobr>`[[T]] -> [T]`</nobr>                           |
| <nobr>`isEmpty X`</nobr>   | Empty check on $X$                        | <nobr>`[T] -> Bool`</nobr>                            |
| <nobr>`repeat k`</nobr>    | Create an infinite list consisting of $k$ | <nobr>`T -> [T]`</nobr>                               |
| <nobr>`repeatn n k`</nobr> | Create a list of $k$ with $n$ elements    | <nobr>`Int T -> [T]`</nobr>                           |
| <nobr>`iterate F k`</nobr> | Repeatedly applying $F$ to $k$            | <nobr>`(T -> T) T -> [T]`</nobr>                      |

Definitions:
- $X$ is a list of type $T$, 
- $k$ is a generic entity, and
- $F$ is function with the $T\rightarrow T$ signature.

#### Lists manipulation methods

| Name                          | Meaning                                               | Signature                             |
| ----------------------------- | ----------------------------------------------------- | ------------------------------------- |
| <nobr>`hd X`</nobr>           | First element of $X$[^4]                              | <nobr>`[T] -> T`</nobr>               |
| <nobr>`tl X`</nobr>           | All except first element $X$[^4]                      | <nobr>`[T] -> [T]`</nobr>             |
| <nobr>`last X`</nobr>         | Last element of $X$[^4]                               | <nobr>`[T] -> T`</nobr>               |
| <nobr>`init X`</nobr>         | All except last element of $X$[^4]                    | <nobr>`[T] -> [T]`</nobr>             |
| <nobr>`take n X`</nobr>       | Take the first $n$ elements of $X$                    | <nobr>`Int [T] -> [T]`</nobr>         |
| <nobr>`takeWhile P X`</nobr>  | Take elements of $X$ until $P$ is false               | <nobr>`(T -> Bool) [T] -> [T]`</nobr> |
| <nobr>`drop n X`</nobr>       | Discard the first $n$ elements of $X$                 | <nobr>`Int [T] -> [T]`</nobr>         |
| <nobr>`dropWhile P X`</nobr>  | Discard elements of $X$ until $P$ is false            | <nobr>`(T -> Bool) [T] -> [T]`</nobr> |
| <nobr>`filter P X`</nobr>     | Filter $X$ using $P$                                  | <nobr>`(T -> Bool) [T] -> [T]`</nobr> |
| <nobr>`map F X`</nobr>        | Apply $F$ to every element of $X$                     | <nobr>`(T -> K) [T] -> [K]`</nobr>    |
| <nobr>`removeDup X`</nobr>    | Unique elements of $X$                                | <nobr>`[T] -> [T]`</nobr>             |
| <nobr>`insertAt i a X`</nobr> | Insert $a$ into $X$ at $i$-th element (shifted right) | <nobr>`Int T [T] -> [T]`</nobr>       |
| <nobr>`removeAt i X`</nobr>   | Remove $i$-th element of $X$                          | <nobr>`Int [T] -> [T]`</nobr>         |
| <nobr>`updateAt i a X`</nobr> | Replace $i$-th element of $X$ with $a$                | <nobr>`Int T [T] -> [T]`</nobr>       |
| <nobr>`splitAt i X`</nobr>    | Split $X$ into two at $i$-th index (left preferred)   | <nobr>`Int [T] -> ([T], [T])`</nobr>  |

[^4]: It will throw a run-time error if invoked on an empty list.

Definitions:
- $X$ is a list of type $T$,
- $a$ has $T$ type,
- $i, n$ are integers,
- $P$ is a predicate with $T\rightarrow\text{Bool}$ signature, and
- $F$ is a function with $T\rightarrow K$ signature .

#### Set-like methods

| Name                             | Meaning                             | Signature                      |
| -------------------------------- | ----------------------------------- | ------------------------------ |
| <nobr>`isMember a X`</nobr>      | True if $a$ is in $X$               | <nobr>`T [T] -> Bool`</nobr>   |
| <nobr>`isAnyMember X Y`</nobr>   | True if $X$ intersects with $Y$     | <nobr>`[T] [T] -> Bool`</nobr> |
| <nobr>`removeMember a X`</nobr>  | Remove all $a$ from $X$             | <nobr>`T [T] -> [T]`</nobr>    |
| <nobr>`removeMembers X Y`</nobr> | Remove all elements of $Y$ from $X$ | <nobr>`[T] [T] -> [T]`</nobr>  |

Definitions:
- $X, Y$ are lists of type $T$,
- $a$ has $T$ type,

#### Logical methods

| Name                   | Meaning                               | Signature                              |
| ---------------------- | ------------------------------------- | -------------------------------------- |
| <nobr>`and Xb`</nobr>  | True if every element in $Xb$ is true | <nobr>`[Bool] -> Bool`</nobr>          |
| <nobr>`or Xb`</nobr>   | True if some element in $Xb$ is true  | <nobr>`[Bool] -> Bool`</nobr>          |
| <nobr>`all P X`</nobr> | $P$ is true for every element in $X$  | <nobr>`(T -> Bool) [T] -> Bool`</nobr> |
| <nobr>`any P X`</nobr> | $P$ is true for some element in $X$   | <nobr>`(T -> Bool) [T] -> Bool`</nobr> |

Definitions:
- $Xb$ is a list of type $\text {Bool}$,
- $X$ is a list of type $T$, and
- $P$ is a predicate with $T\rightarrow\text{Bool}$ signature.

---

### Arrays operations, methods and functions

#### Standard operators

| Operator             | Meaning                   |
| -------------------- | ------------------------- |
| <nobr>`X.[i]`</nobr> | $i$-th element of $X$[^3] |

Definitions:
- $X$ is an array, and
- $i$ is an integer.

#### Standard methods

| Name                        | Meaning                                | Signature                       |
| --------------------------- | -------------------------------------- | ------------------------------- |
| <nobr>`size X`</nobr>       | Size of X                              | <nobr>`{T} -> Int`</nobr>       |
| <nobr>`select X i`</nobr>   | $i$-th element of X                    | <nobr>`{T} Int -> T`</nobr>     |
| <nobr>`update X i a`</nobr> | Replace $i$-th element of $X$ with $a$ | <nobr>`{T} Int T -> {T}`</nobr> |

Definitions:
- $X$ is an array,
- $a$ has $T$ type,
- $i$ is an integer.

---

## Tuples: Relational operators

Relational operations on tuples are the same as on integers.
The semantic meaning is an element-wise comparison.

See [[#Integers: Relational operations]].

## Tuples: Methods

| Name                  | Meaning               | Signature                     |
| --------------------- | --------------------- | ----------------------------- |
| <nobr>`fst X`</nobr>  | First element of $X$  | <nobr>`(T, K) -> T`</nobr>    |
| <nobr>`snd X`</nobr>  | Second element of $X$ | <nobr>`(T, K) -> K`</nobr>    |
| <nobr>`fst3 Y`</nobr> | First element of $Y$  | <nobr>`(T, K, V) -> T`</nobr> |
| <nobr>`snd3 Y`</nobr> | Second element of $Y$ | <nobr>`(T, K, V) -> K`</nobr> |
| <nobr>`thd3 Y`</nobr> | Third element of $Y$  | <nobr>`(T, K, V) -> V`</nobr> |

Definitions:
- $X$ is a two-element tuple, and
- $Y$ is a three-element tuple.

---

## Appendix B: Common errors

### Multiple entry points error

**Error message**:

```
Error [..., ... ,...]: multiply defined
```

**Solution**:

Ensure that your programm has only one **Start**.

**Meaning**:

In Clean, **Start** is used as the entry point of a programm.
Consequently, there should be only **Start**.

In this case, there are more than one **Start** and the compiler is unsure which entry point should be used.

**Example**:

```
// Language: Clean

// ... CODE ...

Start = invoke X Y      // <- Start is defined here

// ... CODE ...

Start = computeSumOf Z  // <- but also here :(
```

### Incorrect type error

**Error message**:

```markdown
...
Type error [...,...,...]: ... : cannot unify demanded type with offered type:
...
```

**Solution**:

Ensure that expression types and expected types are correct.

**Meaning**:

This error can be caused by many things, but commonly by a misunderstading of expression types and actualy return types.

**Example**:

```
// Language: Clean

intToDigit :: Int -> [Int]
intToDigit    n   =  ...

Start = intToDigit 2.3
```

---

## Appendix C: Code recipes

This section contains a collection of common and useful functions.
Each solution includes the implementation as well as the explanation.

### Breaking an integer into digits

**Signature**: $\text{Int}\rightarrow\text{[Int]}$

**Expected result**:

```
// Language: Clean

toDigits 123   // [1, 2, 3]
toDigits 12321 // [1, 2, 3, 2, 1]
```

#### Using recursive function

```
// Language: Clean

toDigits :: Int -> [Int]
toDigits n 
| n < 10 = [n]
| otherwise = (toDigits (n / 10)) ++ [last_digit]
where
	last_digit :: Int
	last_digit = n rem 10
```

**Conversions**: $\text{Int}\rightarrow\text{[Int]}$

**Explanation**:

Given an integer $n$, while $n$ has more than one digit, extract the last digits by using $n\mod 10$.
The total digits of $n$ is reduced by one.

If $n$ has one digits, return $n$ then stop the recursion.

#### Using list comprehension

```
// Language: Clean

toDigits :: Int -> [Int]
toDigits n = [(toInt d) - 48 \\ d <-: (toString n)]
```

**Conversions**: $\text{Int}\rightarrow\text{\{Char\}}\rightarrow\text{[Int]}$

**Explanation**:

Since $n$ is an integer, it has to be converted to a string.
The reason being that an integer cannot be used as a generator, but a string can.

Each digits of $n$ is stored in the variable $d$ which is converted from **a character** to **an integer** based on its ASCII value.

To offset the ASCII value, $48$ is subtracted from it.

### Computing divisors of an integer

**Signature**: $\text{Int}\rightarrow\text{[Int]}$

**Expected result**:

```
// Language: Clean

divisorsOf 9  // [1, 3, 9]
divisorsOf 16 // [1, 2, 4, 8, 16]
divisorsOf 2  // [1, 2]
divisorsOf 0  // [0]
```

#### Using comprehension

```
// Language: Clean

divisorsOf :: Int -> [Int]
divisorsOf 0 = [0]
divisorsOf n = filter isDivisor [d \\ d <- ds]
where
	ds :: [Int]
	ds = [2..(n - 1)]

	isDivisors :: Int -> Bool
	isDivisors k = (n rem k) == 0
```

**Conversions**: $\text{Int}\rightarrow\text{[Int]}$

**Explanation**:

For $n \gt 0$, a list of integers from $2$ to $n - 1$ is constructed.
Integers which are not a divisor of $n$ is discarded. 

### Checking if an integer is prime

**Signature**: $\text{Int} \rightarrow\text{Bool}$

**Expected result**:

```
// Language: Clean

isPrime 9 // False
isPrime 3 // True
isPrime 1 // False
isPrime 0 // False
```

#### Counting divisors list (comprehension)

```
// Language: Clean

isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime n = length (filter isDivisorOfN [d \\ d <- ds]) == 0
where
	ds :: [Int]
	ds =  [2..(n - 1)]

	isDivisorOfN :: Int -> Bool
	isDivisorOfN k = (n rem k) == 0
```

**Conversions**: $\text{Int}\rightarrow\text{[Int]}\rightarrow\text{Int}\rightarrow\text{Bool}$

**Explanation**:

For $n \gt 1$, a list of integers from $2$ to $n - 1$ is constructed.
The list filtered to only contain divisors of $n$.

If the divisor list is empty, $n$ is a prime number.

#### Using list of booleans

```
isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime n = not (or [n rem d == 0 \\ d <- [2..(n - 1)]]) 
```

**Conversions**: $\text{Int}\rightarrow\text{[Int]}\rightarrow\text{[Bool]}\rightarrow\text{Bool}$

------

## About

If you notice any errors or have suggestions for improvements, please feel free to contact me through the following channels:
- Email: b9xp3x@inf.elte.hu
- Instragram: [@_kornthana](https://www.instagram.com/_kornthana/)