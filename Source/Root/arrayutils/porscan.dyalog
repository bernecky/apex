﻿ result←boolean porscan array;b;c
 ⍝ partitioned ∨\array; ∧/,array∊ 0 1 ←→ 1.  each 1 in <boolean> designates the beginning of a part.  ⎕io-independent.
 ⍝ (sauce/porscan.1 from the sharp apl utility library)
 b←,array∨(⍴array)⍴boolean
 c←b/,array
 result←1/(⍴array)⍴≠\b\c≠¯1↓0,c
