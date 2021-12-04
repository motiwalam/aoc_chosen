⍝ day 1: part 1
+/2</⍎¨⊃⎕NGET './data/day1p1.txt' 1

⍝ day 1: part 2
+/2</3+/⍎¨⊃⎕NGET './data/day1p1.txt' 1


⍝ day 2: part 1
(9∘○×11∘○)+/{(⍎⍵)×1 0j1 0j¯1 ⌷⍨'fdu'⍳⊃⍺}/¨(' '∘≠⊆⊢)¨⊃⎕NGET './data/day2p1.txt' 1

⍝ day 2: part 2
×/1↓⊃{⍵+⊃⊃{(⍎⍵)×(1 0 0)(¯1 0 0)(0 1 a)⌷⍨'duf'⍳⊃⍺}/⍺⊣a←⍵[1]}/⌽(⊂0 0 0),' '(≠⊆⊢)¨⊃⎕NGET './data/day2p1.txt' 1


⍝ day 3: part 1
×/2⊥¨500≤1000(-,⊢)+/(⍎¨)¨⊃⎕NGET './data/day3p1.txt' 1

⍝ day 3: part 2
D ← (⍎¨)¨⊃⎕NGET './data/day3p1.txt' 1
g←{1=≢⍺:⍺[1] ⋄ v←(⍺ ⍺⍺(⍵⌷⊃+/⍺)) ⋄ (⍺/⍨⍵{v=⍵[⍺]}¨⍺)⍺⍺ ∇∇ 1+⍵}
×/2⊥¨(D {⍵<2÷⍨≢⍺}g 1),D {⍵≥2÷⍨≢⍺}g 1