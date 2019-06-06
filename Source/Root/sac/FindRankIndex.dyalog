﻿ r←ctl FindRankIndex fns;i;j
⍝ find incidence matrix for ctl, fns for indexing
⍝ Based on first index
 i←(D ctl[;2])[;3]
 j←D fns[;fnsranks]
 j←(((1↑⍴j),4)↑j)[;3] ⍝ Avoid index error
 r←(j∘.=i)∨((⍴j),⍴i)⍴i='*'
