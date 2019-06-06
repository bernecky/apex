﻿ r←EmitMonadicStructuralFns fns;ctl;cv;cvm;sis
 ⍝ Emit Monadic Structural fn SAC code
 ⍝ Result is new code, new (shorter) fns list
 ⍝ Handles ⍉y ⌽y ⊖y ⍪y ,y
 ⍝ These are easy because there are no coercions
 sis←''
 :If ~0∊⍴fns
     ctl←7 FragmentCode'mstruct'
     cvm←<\(ctl FindRankGen fns)∧ctl FindFn fns
     cv←∨/cvm
     :If 1∊cv ⍝ Any work?
         sis←ctl Getsis cvm
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
