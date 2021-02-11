 r←EmitMonadicScalarFns fns;cv;sis;ctl;cvm
⍝# Generate XxS,XxA monadic scalar fn code
 sis←''
 :If ~0∊⍴fns
     ctl←6 FragmentCode'mscalar'
     cvm←<\(ctl FindFn fns)∧ctl FindRankGen fns
     cv←(∨/cvm)∧fnsMonadic fns ⍝ Ignore dyadic fns
     :If 1∊cv ⍝ any work?
         sis←'m'EmitScalarFnsKernels cv⌿fns  ⍝ SxS code
         fns←(~cv)⌿fns
     :EndIf
     r←(E sis),E fns
  ⍝ Generate XxA
     cvm←<\ctl FindFn fns ⍝ Generate all non-SxS
     cv←(∨/cvm)∧fnsMonadic fns
     :If 1∊cv ⍝ Any work?
         p←'msfctl'EmitScalarFnsSub cv⌿fns
         sis←sis,D p[0]
         fns←(~cv)⌿fns
         'failed to gen something'assert 0∊⍴D p[1]
     :EndIf
 :EndIf
 r←(E sis),E fns
