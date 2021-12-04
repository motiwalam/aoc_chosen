# part 1
def part1():
    ctoj = lambda c: {'f':1,'d':1j,'u':-1j}[c[0][0]] * int(c[1])
    with open("./data/day2p1.txt") as f:
        d = (l.strip().split(' ') for l in f.readlines())
        s = sum(map(ctoj, d))
        return s.real * s.imag

# ctoj translates a command to a complex number representing the movement indicated by the command
# forwards  movement is represented by the unit vector 1+0j
# downwards movement is represented by the unit vector 0+1j (downwards is positive)
# upwards   movement is represented by the unit vector 0-1j

# adding them all up gives the net movement
# multiplying the real and imaginary parts of that sum gives the answer


# part 2
def part2():
    # elementwise addition of vectors
    vadd = lambda v1,v2: (*map(sum, zip(v1,v2)),)
    ctov = lambda m,d,a: map(lambda e: e*d,{'f':(0,1,a), 'd': (1,0,0), 'u':(-1,0,0)}[m[0]])
    with open("./data/day2p1.txt") as f:
        data = (l.strip().split(' ') for l in f.readlines())
        s = (0, 0, 0)
        for m,d in data:
            s = vadd(s, ctov(m, int(d), s[0]))

        return s[1]*s[2]

# we represent the state of the submarine as a three-tuple (aim, horizontal, depth)
# we represent the effect of a command on the state as elementwise addition of the state
# by a vector V, where V is dependent on the command:
#      down X -> V =  X, 0, 0
#      up   X -> V = -X, 0, 0
#      fwd  X -> V =  0, X, aim*X

# ctov takes the motion, distance, and current aim, and returns V
# vadd then adds the current state and V, giving us the next state
# at the end, we multiply the horizontal displacement and the death to get the answer