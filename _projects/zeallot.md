---
---
## zeallot

You made the jump from Python to R, you're ready to hit the code running, but
you're missing a treasured Python feature, multiple assignment. Time to try
zeallot.
{: class="fancy"}

The zeallot R package provides an operator for unpacking, destructuring, and
multiple assignment.

```R
library(zeallot)
c(a, b) %<-% c(1, 2)
```

In this first example the variables `a` and `b` are assigned in the calling
environment and assigned, respectively, the values 1 and 2. Due to R's syntax
constraints the usage of `c()` on the left-hand side of the expression is
necessary.

The left-hand side of an assignment expression includes the variables listed
left of the `%<-%` operator. The right-hand side of an assignment expression
includes the values listed right of the `%<-%` operator.

Left-hand side values are evaluated prior to assignment making the following
possible. 

```R
c(a, b) %<-% c(b, a)
```

You may often find your right-hand side has more than 2 values. 

```R
c(a, b, d, e, f) %<-% list(1, 2, 3, 4, 5)
```

Or you may want to skip a value or many values. You can skip a value by position
with `.` or skip many values with `...`.

```R
c(a, .) %<-% c(1, 3030)
c(..., z) %<-% 1:10
```

After running the first line, `a` is assigned 1 and the value 3030 is
ignored. After running the second line, the values 1 through 9 are ignored and
`z` is assigned 10.

More often you will be assigning the result of a function call.

```R
simple <- function() {
  c(1, 2, 3)
}

c(a, b, d) %<-% simple()
```

Certain functions do not always return the same number of values. `head()` or
`tail()` for example may return a fewer number of items than requested.

```R
nums <- 1
c(a, b) %<-% tail(nums, 2)  # whoops!
```

If you run the above example you will get an error. `nums` only has a single value,
so despite asking `tail()` for 2 values we only got 1. In situations like this you
can assign a default value.

```R
nums <- 1
c(a, b = -1) %<-% tail(nums, 2)
```

Now there is no error and `b` is assigned -1.
