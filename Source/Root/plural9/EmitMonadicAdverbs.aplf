 r←EmitMonadicAdverbs fns;cv;sis;ctl;prim;fn;f;fns2;cvm;rnk;tp;sc;sov;lid;rk
 ⍝ Emit scan and reduce derived functions for primitive operands only
 sis←'' ⍝ Assume no work
 :If ~0∊⍴fns
     fns←MarkSpecialCasesReduce fns
     ctl←7 FragmentCode'madverbs'
     ctl←ctl⍪7 FragmentCode'scan'
     cvm←(ctl FindFnOnly fns)∧ctl FindRankGen fns
     cvm←<\cvm∧ctl FindSpecialCases fns
     cv←∨/cvm
     :If 1∊cv ⍝ No work
         sis←ctl Getsis cvm
   ⍝ Compute fetch types for reduce fn, f.
   ⍝ Fake up larg type as being same as rarg.
   ⍝ Works by happenstance, not by intent.
         f←cv⌿fns
         sis←sis SetFill(D f[;fnstypes])[;2] ⍝ Result type
   ⍝ Have to do these now or they get stomped
         sis←(E'$FNAME')Strepl¨ER1(mcb sis),Raze⍉f[;fnslop,fnsfn,fnstypes]
         sis←(E'$FN')Strepl¨ER1(mcb sis),Raze⍉f[;,fnslop]
         rk←(D f[;fnsranks])[;,fnsranksrarg]
         f←((D f[;fnstypes])[;,fnstypesrarg])TypeRank rk
         sis←(E'$YTYPE')Strepl¨ER1(mcb sis),f
         f←fnslop ConjToFns cv⌿fns       ⍝ Set f/ left identity
         lid←EmitReduceFixLid f
         sis←(E'$FRID')Strepl¨ER1(mcb sis),lid
         sov←EmitReduceStopOnValue cv⌿fns
         sis←(E'$STOPONVALUE')Strepl¨ER1(mcb sis),sov
         sis←sis EmitPrimitiveFnDefnsTemplateFiller f
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
