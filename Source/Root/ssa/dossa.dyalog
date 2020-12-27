 r←fldr dossa asts;tn;y;i;ct;ast2;ast3;dfaws;srctok;ast;cds;PFAT
 ⎕←(⍕⎕TS),': Starting SSA analysis for: ',fldr
 InitializeAST
 InitializeSSA
 InitializePFAT
 ct←BuildCallingTree asts
 i←DFSortast(E ct),E asts       ⍝ Depth-first order
 ct←D i[0] ⋄ asts←D i[1]
 cds←asts
 cds←ct SemiGlobalAnalysis cds ⍝ Deal w/semiglobals
 'Post-SemiGlobalAnalysis'TraceSG cds
 cds←ct SemiGlobalUnSet cds    ⍝ Remove Unset SGIs
 'Post=SemiGlobalUnset'TraceSG cds
 Checkem¨cds
 cds←MarkBasicBlocks¨cds       ⍝ Partition ast into basic blocks
 cds←GenerateCFG¨cds           ⍝ Generate Control flow graphs
 cds←GenerateDOM¨cds           ⍝ Generate dominators
 cds←GenerateDF¨cds            ⍝ Generate dominance frontiers
 Checkem¨cds
 cds←GenerateSSA¨cds           ⍝ Generate SSA form
 Checkem¨cds
 cds←csdDeleteNullAstRows¨DeadPHIRemoval¨cds  ⍝ Kill :PHIs w/unref'd target
 Checkem¨cds
 cds←csdDeleteNullAstRows¨ct SemiGlobalUnSet cds ⍝ Kill Unset SGIs
 Checkem¨cds
 cds←csdDeleteNullAstRows¨ct SemiGlobalUnRef cds    ⍝ Kill Unref SGIs
 Checkem¨cds
 cds←csdDeleteNullAstRows¨DeadVarbRemoval¨cds       ⍝ Kill unref'd vars
 Checkem¨cds
 r←cds
 ⎕←(fts ⎕TS),': SSA analysis complete for: ',fldr
