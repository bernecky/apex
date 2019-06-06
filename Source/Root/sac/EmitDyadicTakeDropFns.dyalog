 r←EmitDyadicTakeDropFns fns;ctl;cvm;sis;cv
 ⍝ Emit take and drop functions
 ⍝ No changes in right argument type, as in the
 ⍝ Structural fns. Perhaps this can be merged
 ⍝ with it.
 sis←''
 :If ~0∊⍴fns
     ctl←7 FragmentCode'takedrop'
     cvm←<\(ctl FindRankGen fns)∧ctl FindFn fns
     cv←∨/cvm
     :If 1∊cv ⍝ Got work?
         sis←ctl Getsis cvm
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         sis←sis SetFill(D cv⌿fns[;fnstypes])[;,2]
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
