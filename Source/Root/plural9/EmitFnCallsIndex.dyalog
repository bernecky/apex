﻿ r←EmitFnCallsIndex y;ast;cv;fns;cal;j
 ⍝# Emit fn calls for indexed reference: X[I] and
 ⍝# Indexed assign: X[I]←Y
 r←EmitFnCallsIndexRef y
 r←EmitFnCallsIndexSet r
 ast←D r[0]
 cv←D r[1]
 fns←D r[2]
 cal←D r[3]
 j←ast[;astfn]∊E,';' ⍝ Don't emit anything for list entries
 cv←cv∧~j
 cal[j/⍳⍴j;]←E''
 r←(E ast),(E cv),(E fns),E cal
