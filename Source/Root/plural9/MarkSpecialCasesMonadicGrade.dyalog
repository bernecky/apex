﻿ r←ast MarkSpecialCasesMonadicGrade fns;cv;b
⍝# Generate special case names for upgrade/downgrade
 r←fns
 cv←ast[;astfn]∊(E,'⍒'),E,'⍋'
 :If 1∊cv ⍝Stupid APL2 prototypes
     b←D ast[D ast[cv/⍳⍴cv;astrarg];astPred]
     b←b[;astPredPV]
     r[b/cv/⍳⍴cv;fnsspec]←E'PV'
 :EndIf
