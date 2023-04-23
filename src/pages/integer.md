---
layout: "@layouts/Layout.astro"
title: Integers
Last updated: April 15th, 2023

Revisions: 2
Data of last revision: 12 APR 2023
---

# Integer

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