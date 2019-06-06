 r←ast FindTarget p;cv
⍝ Find targets for astptrs p
 r←,p
 cv←r∊⍳≢ast
 r[cv/⍳⍴cv]←ast[cv/r;asttarget]
 r←(⍴p)⍴r

