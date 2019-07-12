r←fldr dodfaOne asts;y;i;tn;ct;ast2;ast3;ast;genws;cds;cds2;cds3;i2
 ⍝ Perform dfa on asts
 (fts ⎕TS),': Starting dataflow analysis for: ',fldr
 asts←MakeBackupAstForCloning¨asts
 i←BuildCallingTree asts ⍝ Calling tree
 i←i DFSortast asts ⍝ Depth-first order for osc2
 ct←D i[0] ⋄ cds←D i[1]
 cds←D i[1]
 Checkem¨cds
 cds←MoveLopToLarg¨cds     ⍝ Cleanup for scan/reduce vs replicate/expand
 cds←InitializeWL¨cds
 Checkem¨cds
 cds←(E ct)InitializeShapeClique¨cds
 Checkem¨cds
 cds←ConstProp¨cds         ⍝ Propagate constant info
 Checkem¨cds
 cds←SetSystemVarbTypes¨cds
 Checkem¨cds
 cds3←cds
 :While 1 ⍝ Loop until fix point reached
     cds←cds3
     cds2←(E fldr) dfa¨cds     ⍝ Do one round of dfa
     Checkem¨cds2
     cds3←dfaUpDown cds2   ⍝ Global dfa propagation
     Checkem¨cds3
 :Until cds≡cds3
 i←dfaOK¨cds               ⍝ Got enough info to run code generator?
 i2←astsFnName¨(~i)/cds
 ('missing type or rank information in fns: ',⍕i2)assert 0∊⍴i2
 cds←KillQUADctInCalls¨cds  ⍝ Remove dead ⎕ct refs from primitive fns
 ct←BuildCallingTree cds    ⍝ All calling trees are the same
 cds←ct SemiGlobalUnRef cds ⍝ Remove ⎕ct refs from defined fns/calls
 cds←dfaSGFix¨cds           ⍝ Fix up :PHI semiglobal stupidity
 Checkem¨cds
 r←cds
 (fts ⎕TS),': Dataflow analysis complete for: ',fldr
