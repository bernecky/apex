 r←EmitDyadicCatlamFns fns;ctl;sis;cvm;cv
 ⍝# Emit Dyadic catenate/laminate functions
 ⍝# r=genned code, new fns
 ⍝# Handles x,y  x⍪y   - no support for axis brackets
 sis←''
 :If ~0∊⍴fns
     ctl←7 FragmentCode'catlam'
     cvm←(ctl FindRankGen fns)∧ctl FindFn fns
     cvm←<\cvm∧ctl FindSpecialCases fns
     cv←∨/cvm
     :If 1∊cv ⍝ Got work?
         sis←ctl Getsis cvm ⍝ Get loop ctl fragments
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
