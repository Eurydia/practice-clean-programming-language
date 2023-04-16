`theme-toggle`

## Table of contents

[[#Introduction]]

1. [[#Breaking an integer into digits]] 
2. [[#Computing divisors of an integer]]
3. [[#Checking if an integer is prime]]

## Introduction

This is a collection of common and useful functions.
Each solution includes the implementation as well as the explanation.

## Breaking an integer into digits

**Signature**: $\text{Int}\rightarrow\text{[Int]}$

**Expected result**:

```Elixir
// Language: Clean

toDigits 123   // [1, 2, 3]
toDigits 12321 // [1, 2, 3, 2, 1]
```

### Using recursive function

```Elixir
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

### Using list comprehension

```Elixir
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

## Computing divisors of an integer

**Signature**: $\text{Int}\rightarrow\text{[Int]}$

**Expected result**:

```Elixir
// Language: Clean

divisorsOf 9  // [1, 3, 9]
divisorsOf 16 // [1, 2, 4, 8, 16]
divisorsOf 2  // [1, 2]
divisorsOf 0  // [0]
```

### Using comprehension

```Elixir
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

## Checking if an integer is prime

**Signature**: $\text{Int} \rightarrow\text{Bool}$

**Expected result**:

```Elixir
// Language: Clean

isPrime 9 // False
isPrime 3 // True
isPrime 1 // False
isPrime 0 // False
```

### Counting divisors list (comprehension)

```Elixir
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

### Using list of booleans

```Elixir
isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime n = not (or [n rem d == 0 \\ d <- [2..(n - 1)]]) 
```

**Conversions**: $\text{Int}\rightarrow\text{[Int]}\rightarrow\text{[Bool]}\rightarrow\text{Bool}$
