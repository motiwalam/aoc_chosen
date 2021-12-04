# represent each binary number as vector of 1's and 0's
# reduce the vector of vectors by elementwise vector addition
# map 500≤ and 500> to the counts vector to get the two rates
# decode in base 2 and multiply
def part1():
    from functools import reduce, partial
    from operator import le,gt
    vadd   = lambda a,b: map(sum, zip(a,b))
    decode = lambda v,b: 0 if not v else b*decode(v[:-1], b) + v[-1]
    with open('./data/day3p1.txt') as f:
        d = (map(int, (*l.strip(),)) for l in f.readlines())
        counts = *reduce(vadd, d),
        return decode((*map(partial(le, 500), counts),), 2) * decode((*map(partial(gt, 500), counts),),2)


def part2():
    from functools import reduce, partial
    vadd   = lambda a,b: map(sum, zip(a,b))
    decode = lambda v,b: 0 if not v else b*decode(v[:-1], b) + v[-1]

    def f(c, i, m):
        if len(c) == 1:
            return c[0]

        counts = *reduce(vadd, c),
        v = counts[i] >= len(c)/2 if m else counts[i] < len(c)/2
        return f((*filter(lambda e: e[i] == v, c),), i+1, m)

    with open('./data/day3p1.txt') as t:
        d = [tuple(map(int, (*l.strip(),))) for l in t.readlines()]

        return reduce(lambda a,b: a*b, map(partial(decode, b=2), (f(d, 0, True), f(d, 0, False))))


