﻿ r←ast GenFragNamesIndex fns;cv;tr;tp;rk
⍝ Gen function names for indexed ref/assign
 cv←ast[;astfn]∊(E,'['),E,']' ⍝ Locate all index calls
 :If 1∊cv ⍝ Any work?
     tr←ast IndexTypeRank cv
     fns[cv/⍳⍴cv;fnstypes]←D tr[0] ⍝ Types
     fns[cv/⍳⍴cv;fnsranks]←D tr[1] ⍝ Ranks
 :EndIf
 r←fns
