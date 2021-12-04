# day 1: part 1
def part1():
    from functools import partial, reduce
    from operator import lt

    with open("./data/day1p1.txt") as f:
        d = (int(l.strip()) for l in f.readlines())
        return sum(map(partial(reduce, lt), zip(d, d[1:])))

# day 1: part 2
def part2():
    from functools import partial, reduce
    from operator import lt, add
    from itertools import pairwise
    from more_itertools import triplewise

    with open("./data/day1p1.txt") as f:
        d = (int(l.strip()) for l in f.readlines())
        sums = map(partial(reduce, add), triplewise(d))
        return sum(map(partial(reduce, lt), pairwise(sums)))


# day 2: part 1
def part1():
    ctoj = lambda c: {'f':1,'d':1j,'u':-1j}[c[0][0]] * int(c[1])
    with open("./data/day2p1.txt") as f:
        d = (l.strip().split(' ') for l in f.readlines())
        s = sum(map(ctoj, d))
        return s.real * s.imag


# day 2: part 2
def part2():
    vadd = lambda v1,v2: (*map(sum, zip(v1,v2)),)
    ctov = lambda m,d,a: map(lambda e: e*d,{'f':(0,1,a), 'd': (1,0,0), 'u':(-1,0,0)}[m[0]])
    with open("./data/day2p1.txt") as f:
        data = (l.strip().split(' ') for l in f.readlines())
        s = (0, 0, 0)
        for m,d in data:
            s = vadd(s, ctov(m, int(d), s[0]))

        return s[1]*s[2]
