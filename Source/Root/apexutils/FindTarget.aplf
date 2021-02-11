 r←ast FindTarget p;cv
⍝ Find targets for astptrs p
 r←,p
 cv←r∊⍳≢ast
 :If 1⍴cv ⍝ Stupid APL2 prototypes
     r[cv/⍳⍴cv]←ast[cv/r;asttarget]
 :EndIf
 r←(⍴p)⍴r
