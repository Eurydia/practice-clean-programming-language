`theme-toggle`

# Table of Contents

1. [[#Multiple entry points error]]
2. [[#Incorrect type error]]

# Multiple entry points error

**Error message**:

```markdown
Error [...,...,...]: multiply defined
```

**Solution**:

Ensure that your programm has only one **Start**.

**Meaning**:

In Clean, **Start** is used as the entry point of a programm.
Consequently, there should be only **Start**.

In this case, there are more than one **Start** and the compiler is unsure which entry point should be used.

**Example**:

```Elixir
// Language: Clean

// ... CODE ...

Start = invoke X Y      // <- Start is defined here

// ... CODE ...

Start = computeSumOf Z  // <- but also here :(
```

# Incorrect type error

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

```Elixir
// Language: Clean

intToDigit :: Int -> [Int]
intToDigit    n   =  ...

Start = intToDigit 2.3
```
