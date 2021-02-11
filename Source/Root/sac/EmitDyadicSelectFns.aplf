 r←EmitDyadicSelectFns fns;ctl;f;sis;cvm;cv
 ⍝ Emit Dyadic Selection and Search fn SAC code
 ⍝ Result is new code, new (shorter) fns list
 ⍝ Handles x⍴y x∊y x⍳y x⍷y x≡y
 ⍝ No changes in right argument type, as in the
 ⍝ Structural fns. Perhaps this can be merged w/it.
 sis←''
 :If ~0∊⍴fns
     ctl←7 FragmentCode'reshape'
     ctl←ctl dcb 7 FragmentCode'epio'
     cvm←(ctl FindRankGen fns)∧(ctl FindFn fns)∧ctl FindType fns
     cvm←<\cvm∧ctl FindSpecialCases fns
     cv←∨/cvm
     :If 1∊cv ⍝ An work?
         sis←ctl Getsis cvm
         f←⍪Raze⍉cv⌿fns[;fnslop,fnsfn,fnsrop,fnstypes] ⍝ Genned fn names
         sis←sis EmitPrimitiveFnDefnsTemplateFiller cv⌿fns
         sis←sis SetFill(D cv⌿fns[;fnstypes])[;,2] ⍝ Set fill to result type
         sis←sis InsertSysvarHeader GenSysvarArgs cv⌿fns
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
