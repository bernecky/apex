﻿ r←nn RenumberStk stk;cv;p
 ⍝ Renumber stk pointers. This is needed whenever the ast changes shape.
 ⍝ A pointer i in stk is replaced by nn[i].
 p←stk[;Stkvalue]
 cv←(~p∊NULL)∧isnum p ⍝ Ignore nulls and non-numbers
 r←stk
 p[cv/⍳⍴cv]←nn[cv/p]
 r[;Stkvalue]←p
