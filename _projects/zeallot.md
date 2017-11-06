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
constraints usage of `c()` is necessary on an assignment expression's left-hand
side.

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


