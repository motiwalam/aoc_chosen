⍝ part 1

⍝ with complex numbers
(9∘○×11∘○)+/{(⍎⍵)×1 0j1 0j¯1 ⌷⍨'fdu'⍳⊃⍺}/¨' '(≠⊆⊢)¨ ⊃⎕NGET './data/day2p1.txt' 1

⍝ without complex numbers
×/⊃⊃+/{(⍎⍵)×⊃((1 0)(0 1)(0 ¯1)) ⌷⍨'fdu'⍳⊃⍺}/¨' '(≠⊆⊢)¨ ⊃⎕NGET './data/day2p1.txt' 1

⍝ the general idea: map a command to a complex number,
⍝                   multiply that complex number with the corresponding distance,
⍝                   sum all the results
⍝                   multiply the imaginary part by the complex part

⍝ step 1: importing the data ( ⊃⎕NGET './data/day2p1.txt' 1 )

⍝ step 2: formatting the data ( ' '(≠⊆⊢)¨ )
⍝   the following (≠⊆⊢) is a function train
⍝   it first applies ≠ to its left and right arguments, which returns a boolean vector where 0's
⍝    correspond to spaces
⍝   it then applies the 'right' (⊢) function to its left and right argument
⍝   it then applies ⊆ (partition) between the two results, which has the effect of
⍝    splitting its right argument on spaces
⍝
⍝   the idea is to convert "forward 2" to ["forward", "2"]
⍝   the train is mapped to each element in the data vector imported in step 1

⍝ step 3: map commands to complex numbers ( {(⍎⍵)×1 0j1 0j¯1 ⌷⍨'fdu'⍳⊃⍺}/¨ )
⍝   first, the reduction each (/¨) is a convenient way to insert
⍝   a dyadic function between the elements of a command vector
⍝
⍝   the dfn indexes the 3 element vector of complex numbers:
⍝        1 0j1 0j¯1
⍝   by command (⍺) so that forward is 1, down is 0j1, up is 0j¯1
⍝
⍝   it multiplies the result by execute omega (⍎⍵), which converts the character vector
⍝   representing the digits to an actual numeric value

⍝ step 4: finishing it off ( (9∘○×11∘○) +/ )
⍝   in the previous step, we created a vector of complex numbers, each representing the
⍝   movement of the submarine.
⍝   now, we add them all up (+/) to get the net movement.
⍝   finally, we multiply the imaginary part by the real part ( 9∘○×11∘○ ) to get the answer







⍝ part 2
×/1↓⊃{⍵+⊃⊃{(⍎⍵)×(1 0 0)(¯1 0 0)(0 1 a)⌷⍨'duf'⍳⊃⍺}/⍺⊣a←⍵[1]}/⌽(⊂0 0 0),' '(≠⊆⊢)¨ ⊃⎕NGET './data/day2p1.txt' 1

⍝ the above is kind of a beautiful mess so heres a cleaner version
D ← ' '(≠⊆⊢)¨ ⊃⎕NGET './data/day2p1.txt' 1
f ← {
    a ← ⍵[1]
    ⍵+⊃⊃{(⍎⍵)×(1 0 0)(¯1 0 0)(0 1 a)⌷⍨'duf'⍳⊃⍺}/⍺
}
×/1↓⊃f/⌽(⊂0 0 0),D

⍝ the general idea:
⍝   let S be the state of the submarine: (aim horizontal depth)
⍝   the new state is S + V, where V depends on the command:
⍝      down X -> V =  X 0 0
⍝      up   X -> V = -X 0 0
⍝      fwd  X -> V =  0 X aim×X
⍝
⍝ we start with S0 C0 C1 C2 ...
⍝ and reduce with a function that takes S_i and C_i and returns S_i+1
⍝ except, since APL reduces right, we reverse the data before applying the reduction
