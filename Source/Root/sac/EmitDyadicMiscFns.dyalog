﻿ r←EmitDyadicMiscFns fns;ctl;n;cv;sis
 ⍝ Emit Dyadic Miscellaneous fn SISAL code
 ⍝ r=genned code, new fns
 ⍝ Handles x€y x⌹y x?y x⊥y x⊤y x⍕y x≡y
 sis←''
 :If ~0∊⍴fns
     ctl←7 FragmentCode'dmisc'
     ctl←ctl⍪7 FragmentCode'dgrade'
     ctl←ctl⍪7 FragmentCode'query'
     n←<\(ctl FindFn fns)∧(ctl FindRankGen fns)∧ctl FindType fns
     cv←∨/n
     :If (1∊cv) ⍝ Got work?
         sis←ctl Getsis n ⍝ Get loop ctl fragments
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         sis←sis InsertSysvarHeader GenSysvarArgs cv⌿fns
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
