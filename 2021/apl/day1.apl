⍝ part 1
+/2</⍎¨⊃⎕NGET './data/day1p1.txt' 1

⍝ step 1: importing the data ( ⊃⎕NGET './data/day2p1.txt' 1 )
⍝   ⎕NGET with the flag 1 returns a vector character vectors, each nested vector
⍝   representing a single line. ⊃ (pick) is applied to the result as the function
⍝   returns additional, irrelevant information.

⍝ step 2: compare each each element with the one after it ( 2</ )
⍝   the reduction operator (/) with a left argument specified reduces
⍝   with its operand function not the entire array at once, but windows of it
⍝   the windows slide over the array one element at a time
⍝   2</ 1 2 3 4  <->  (1 < 2) (2 < 3) (3 < 4)

⍝ step 3: counting the results ( +/ )
⍝ since < returns a boolean, and a boolean is a 1 or a 0, we can simply sum the
⍝ result of the reduction in step 2 with +/ to get our answer.





⍝ part 2
+/2</3+/⍎¨⊃⎕NGET './data/day1p1.txt' 1

⍝ the solution is exactly the same, using the same techniques
⍝ instead of doing pairwise comparisons on the array, we first sum 3 elements
⍝ at a time (3+/) and then do the pairwise comparisons on the result of that