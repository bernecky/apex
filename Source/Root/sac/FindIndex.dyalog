﻿ r←prim FindIndex fns;f;rk;k
⍝ Find best match for index ref/assign code gen
 r←prim FindFn fns
 →(1∊r)↓0 ⍝ No indexing today
 k←fns ⍝ Index fragments are labelled XIY, not XYZI
 k[;4]←ER1(D k[;4])[;0 3 1] ⍝ rank of lhs, rhs,
 rk←prim FindRank k
 r←<⍀r∧rk
