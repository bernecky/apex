 r←EmitMonadicMiscFns fns;cv;sis;fn;cvm;ctl
 ⍝ Emit Monadic Miscellaneous fn SAC code
 ⍝ r=genned code, new fns list
 ⍝ Handles ⍋y  ⍒y ⍳y ⎕← ,⍵ ⍴⍵ ⍕⍵  ←⍞
 sis←''
 :If ~0∊⍴fns
     ctl←7 FragmentCode'mgrade'
     ctl←ctl⍪7 FragmentCode'thorn'
     ctl←ctl⍪7 FragmentCode'mmisc'
     ctl←ctl⍪7 FragmentCode'query'
     ctl←ctl⍪7 FragmentCode'quotequad'
     cvm←(ctl FindRankGen fns)∧(ctl FindFn fns)∧ctl FindType fns
     cvm←<\cvm∧ctl FindSpecialCases fns
     cv←∨/cvm
     :If 1∊cv
         sis←ctl Getsis cvm
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
