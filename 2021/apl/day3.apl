⍝ part 1
×/2⊥¨500≤1000(-,⊢)+/(⍎¨)¨⊃⎕NGET './data/day3p1.txt' 1

⍝ step 1: importing data ( ⊃⎕NGET './data/day3p1.txt' 1 )

⍝ step 2: formatting data ( (⍎¨)¨ )
⍝  convert each binary string into a vector of 1's and 0's

⍝ step 3: get count of 1's for each position ( +/ )
⍝  reduction with vector addition

⍝ step 4: put count vector for 1's and 0's together ( 1000(-,⊢) )
⍝  a function train (-,⊢) with left argument 1000 and right argument
⍝   count vector for the 1's.

⍝ step 5: convert count vectors to binary vectors (500 ≤)
⍝  a one if the count is greater than or equal to 500

⍝ step 6: decode both binary vectors from base 2 ( 2⊥¨ )

⍝ step 7: multiply reduce


⍝ part 2
D ← (⍎¨)¨⊃⎕NGET './data/day3p1.txt' 1
g←{1=≢⍺:⍺[1] ⋄ v←(⍺ ⍺⍺(⍵⌷⊃+/⍺)) ⋄ (⍺/⍨⍵{v=⍵[⍺]}¨⍺)⍺⍺ ∇∇ 1+⍵}
×/2⊥¨(D {⍵<2÷⍨≢⍺}g 1),D {⍵≥2÷⍨≢⍺}g 1

⍝ part 2 - alternative
h ← {
   2=+/≢¨⍺:⍺
   c1 c2 ← ⍺
   v1 ← c1 {⍵≥2÷⍨≢⍺}⍵⌷⊃+/c1
   v2 ← c2 {⍵<2÷⍨≢⍺}⍵⌷⊃+/c2
   nc1 ← c1/⍨(1=≢c1)∨⍵{v1=⍵[⍺]}¨c1
   nc2 ← c2/⍨(1=≢c2)∨⍵{v2=⍵[⍺]}¨c2
   (nc1 nc2) ∇ 1+⍵
}
⊃⊃×/2⊥¨¨1 h⍨ ,⍨⊂(⍎¨)¨⊃⎕NGET './data/day3p1.txt' 1

⍝ step 1: importing and formatting data ( D ← (⍎¨)¨⊃⎕NGET './data/day3p1.txt' 1 )
⍝ step 2: defining the filter function