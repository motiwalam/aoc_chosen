#!/usr/bin/env python3.10

# part 1
def part1():
    from functools import partial, reduce
    from operator import lt

    with open("./data/day1p1.txt") as f:
        d = (int(l.strip()) for l in f.readlines())
        return sum(map(partial(reduce, lt), zip(d, d[1:])))

# i believe the code needs little explanation
# zip(d, d[1:]) gives sliding pairs, we could also have used itertools.pairwise


# part 2
def part2():
    from functools import partial, reduce
    from operator import lt, add
    from itertools import pairwise
    from more_itertools import triplewise

    with open("./data/day1p1.txt") as f:
        d = (int(l.strip()) for l in f.readlines())
        sums = map(partial(reduce, add), triplewise(d))
        return sum(map(partial(reduce, lt), pairwise(sums)))


# alternative solution
def part2():
    from functools import partial, reduce
    with open("./data/day1p1.txt") as f:
        d = [int(l.strip()) for l in f.readlines()]
        return sum(map(partial(reduce, lt), zip(d, d[3:])))

# implementations of partial, reduce, lt, add, pairwise, and triplewise

# definitely not equivalent to functools.partial, but sufficient for
# this problem, this simply curries (f :: a -> b -> c) to f :: b -> c
partial = lambda f, a: lambda b: f(a, b)

# also not equivalent to functools.reduce, sufficient for this problem
# with some changes, as it does not work with generators
# plus it fails on empty lists
reduce = lambda f,c: c[0] if len(c) == 1 else f(c[0], reduce(f, c[1:]))

lt = lambda a,b: a<b
add = lambda a,b: a+b

# again, not equivalent to the functions in itertools
# these don't work on generators either so thats a problem
pairwise   = lambda d: zip(d, d[1:])
triplewise = lambda d: ( (d[i], d[i+1], d[i+2]) for i in range(len(d)-2) )

# parts 1 and 2 using the above definitions
def part1():
    with open('./data/day1p1.txt') as f:
        d = [int(l.strip()) for l in f.readlines()]
        return sum(map(partial(reduce, lt), pairwise(d)))



def part2():
    with open('./data/day1p1.txt') as f:
        d = [int(l.strip()) for l in f.readlines()]
        sums = map(partial(reduce, add), triplewise(d))
        return sum(map(partial(reduce, lt), pairwise((*sums,))))
