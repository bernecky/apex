﻿ r←x mclear i
 ⍝ Clear elements of x to 1, given
 ⍝ matrix of indices i.
 r←,x ⋄ i←⍉(⍴x)⊥⍉i ⋄ r[i]←0 ⋄ r←(⍴x)⍴r
