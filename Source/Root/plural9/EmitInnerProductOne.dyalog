 sis←EmitInnerProductOne fns;ctl;cvm;cv;sis
 ⍝# Emit one dyadic conj fn SAC function
 ⍝# Kludge for inner product, outer product:
 ctl←7 FragmentCode'dconj'
 cvm←(ctl FindFnOnly fns)∧(ctl FindRankGen fns)
 cvm←cvm∧ctl FindSpecialCases fns
 cvm←<\cvm
 cv←∨/cvm
 sis←ctl Getsis cvm
 :If 1∊cv ⍝ Any work?
     sis←sis EmitInnerProductIPALG fns     ⍝ Name of inner prod alg
     sis←sis EmitInnerProductSPECRED fns   ⍝ Special-case reductions
     sis←sis EmitInnerProductSTARIdent fns ⍝ Star-only stuff
     sis←sis EmitInnerProductOneTRANSPOSE fns
 :EndIf
 r←sis
