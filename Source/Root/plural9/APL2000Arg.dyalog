﻿ r←ast APL2000Arg n;t
⍝ Build APL2000 ⎕na argument/result descriptor for
⍝ ast[n;]
 r←''
 t←D ast[n;asttype]
 :If ~t=NULL ⍝ No argument here
     t←(APL2000Types)[1+t;] ⍝ Type of thing.
     r←D ast[n;astrank]
     r←('**'[r>0]),t  ⍝ Confusion on indirectness
     r←(r≠' ')/r
 :EndIf
