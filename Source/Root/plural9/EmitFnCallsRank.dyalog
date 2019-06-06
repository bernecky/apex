﻿ r←EmitFnCallsRank y;ast;fns;cal;cv;t;rks;ar
⍝# Emit calls for rank conjunction invocations
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 cv←MarkRankCalls ast ⍝ We'll gen calls for these
 :If 1∊cv ⍝ Any work?
 ⍝ Build calls as(M|D),'nuax',(arg ranks),(cell ranks)
     ar←D cv⌿ast[;astlarg]
     t←('dm'[ast[ar;astrank]=NULL]),¨E'nuax' ⍝ Dyadic vs monadic call
     rks←cv⌿fns[;fnsnuaxk]
     cal[cv/⍳⍴cv;calfn]←t,¨rks,¨cv⌿fns[;fnsspec]
     cal[cv/⍳⍴cv;caltypes]←E''
     cal←cv EmitAssignment(E ast),E cal
 :EndIf
 r←y ⋄ r[2]←E fns ⋄ r[3]←E cal
