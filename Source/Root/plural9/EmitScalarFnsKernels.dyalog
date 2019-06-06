﻿ r←md EmitScalarFnsKernels fns;sis;ctl;cv;cvm
⍝# Subfn that actually emits SxS code
⍝# Result is vector of sis, updated fns
 sis←''
 :If ~0∊⍴fns ⍝ Any work?
     ctl←6 FragmentCode md,'scalar'
     cvm←<\(ctl FindRankGen fns)∧(ctl FindFn fns)∧ctl FindType fns
     cv←∨/cvm
     :If 1∊cv   ⍝ Any work?
         sis←ctl Getsis cvm
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         sis←sis InsertSysvarHeader GenSysvarArgs cv⌿fns
     :EndIf
 :EndIf
 r←sis
