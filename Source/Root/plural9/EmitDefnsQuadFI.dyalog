﻿ r←EmitDefnsQuadFI fns;cv;sis;fn;cvm;ctl
 ⍝# Emit ⎕fi, ⎕vi definitions
 sis←''
 :If ~0∊⍴fns
     ctl←6 FragmentCode'quadfi'
     cvm←<\(ctl FindRankGen fns)∧(ctl FindFn fns)∧ctl FindType fns
     cv←∨/cvm
     :If 1∊cv
         sis←ctl Getsis cvm
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
