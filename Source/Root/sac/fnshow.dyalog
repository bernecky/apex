﻿ r←fnshow y;i;j;k;m
 ⍝ Show all occurences of y in workspace.
 i←⎕NL 3
 r←0⍴''
lp:→(0∊⍴i)⍴lz
 k←⎕CR j←i[⎕IO;]
 m←(∨/y⍷k)⌿k
 m←(((1↑⍴m),⍴j)⍴j),m
 r←r⍪(~0∊⍴m)/⊂m
 i←1 0↓i
 →lp
lz:r←⍕((⍴r),1)⍴r
 r←((1↑⍴r),⎕PW⌊¯1↑⍴r)↑r
