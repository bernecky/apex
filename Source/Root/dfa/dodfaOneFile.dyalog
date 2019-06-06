 dodfaOneFile tn;y;i;tn;ct;ast2;ast3;ast;genws;cds;cds2;cds3;fnm;i2
 ⍝ Perform dfa on file tn
 fnm←,(⎕FNUMS=tn)⌿⎕FNAMES
 (fts ⎕TS),': Starting dataflow analysis for: ',fnm
 cds←⎕FREAD tn,¯1+1↑1↓⎕FSIZE tn ⍝ Compilation dataset
 cds←MakeBackupAstForCloning¨cds
 i←BuildCallingTree cds ⍝ Calling tree
 i←i DFSortast cds ⍝ Depth-first order for osc2
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
     cds2←dodfaone¨cds     ⍝ Do one round of dfa
     Checkem¨cds2
     cds3←dfaUpDown cds2   ⍝ Global dfa propagation
     Checkem¨cds3
 :Until cds≡cds3
 i←dfaOK¨cds               ⍝ Got enough info to run code generator?
 i2←1⍴¨¨1⍴¨(~i)/cds
 ('missing type or rank information in fns: ',⍕i2)assert 0∊⍴i2
 cds←KillQUADctInCalls¨cds  ⍝ Remove dead ⎕ct refs from primitive fns
 ct←BuildCallingTree cds    ⍝ All calling trees are the same
 cds←ct SemiGlobalUnRef cds ⍝ Remove ⎕ct refs from defined fns/calls
 cds←dfaSGFix¨cds           ⍝ Fix up :PHI semiglobal stupidity
 Checkem¨cds
 i←cds fappend tn
 (fts ⎕TS),': Dataflow analysis complete for: ',fnm
