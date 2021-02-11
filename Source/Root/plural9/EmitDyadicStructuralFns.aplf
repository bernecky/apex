 r←EmitDyadicStructuralFns fns;ctl;cvm;cv;sis
 ⍝ Emit Dyadic Structural fn SISAL code
 ⍝ r=genned code, new fns
 ⍝ Handles x€y x⌹y x?y x⊥y x⊤y x⍕y and don't forget rotate
 sis←''
 :If ~0∊⍴fns
     ctl←7 FragmentCode'dstruct'
     cvm←<\(ctl FindRankGen fns)∧ctl FindFn fns
     cv←∨/cvm
     sis←E''
     :If (1∊cv) ⍝ Any work?
         sis←ctl Getsis cvm ⍝ Get loop ctl fragments
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
