﻿ r←EmitNiladicMiscFns fns;cv;sis;fn;cvm;ctl
 ⍝ Emit Monadic Miscellaneous fn SAC code
 ⍝ Handles ⎕av, ⎕ts
 sis←''
 :If ~0∊⍴fns
     ctl←7 FragmentCode'sysfnsniladic'
     cvm←(ctl FindRankGen fns)∧ctl FindFn fns
     cv←∨/cvm
     :If 1∊cv
         sis←ctl Getsis cvm
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
