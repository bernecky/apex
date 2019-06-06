 r←x mset i
 ⍝ Set elements of x to 1, given matrix of
 ⍝ indices i.
 r←,x ⋄ i←⍉(⍴x)⊥⍉i ⋄ r[i]←1 ⋄ r←(⍴x)⍴r
