 r←EmitDyadicScalarFns fns;cv;p;ctl;cvm;sis
⍝# Generate SxS,SxA, AxS, AxA scalar fn code
 sis←''
 ctl←6 FragmentCode'dscalar'
 cvm←<\(ctl FindFn fns)∧ctl FindRankGen fns
 cv←(∨/cvm)∧~fnsMonadic fns ⍝ Ignore monadic fns
 :If 1∊cv ⍝ any work?
     sis←'d'EmitScalarFnsKernels cv⌿fns  ⍝ SxS code
     fns←(~cv)⌿fns
 :EndIf
 r←(E sis),E fns
⍝ Generate SxA, AxS, AxA
 cvm←<\ctl FindFn fns ⍝ Generate all non-SxS
 cv←(∨/cvm)∧~fnsMonadic fns
 :If 1∊cv ⍝ Any work?
     p←'dsfctl'EmitScalarFnsSub cv⌿fns
     sis←sis,D p[0]
     'failed to gen something'assert 0∊⍴D p[1]
     fns←(~cv)⌿fns
 :EndIf
 r←(E sis),E fns
