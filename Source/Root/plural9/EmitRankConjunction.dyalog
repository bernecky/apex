 r←EmitRankConjunction fns;sis;ctl;cvm;cv;fn;fns2;crks;frks;case;u;zcshp
 ⍝# Emit Rank conjunctions, both monadic and dyadic
 sis←,E''
 ctl←7 FragmentCode'mdrank'
 cvm←(ctl FindFnOnly fns)∧ctl FindRankGen fns
 cvm←<\cvm∧(ctl FindSpecialCases fns)
 cv←∨/cvm
 :If 1∊cv                     ⍝ Any work?
     frks←EmitRankFrameRanks cv⌿fns
     crks←EmitRankCellRanks cv⌿fns
     sis←ctl Getsis cvm
     fn←'md'[IsDyadic cv⌿fns]   ⍝ Dyadic only today
     'coding time for monadic case'assert'd'∧.=fn
     fn←Raze⍉(cv⌿fns[;fnslop]),fn,cv⌿fns[;fnsfn,fnsnuaxk,fnsspec]
     sis←(E'$FNAME')Strepl¨ER1(mcb sis),mcb fn
     fns2←fnslop ConjToFns cv⌿fns
     fns2[;fnstypes]←cv⌿fns[;fnstypes]
     fns2[;fnscomtyp]←PFATct PFATProperty fns2
     u←,D Raze PFATuni PFATProperty fns2
     'F must be a uniform function in F"k'assert'1'∧.=u
     zcshp←crks EmitRankZCellShape fns2
     crks←1 0⍕crks
     sis←(E'$XRANK')Strepl¨ER1(mcb sis),mcb crks[;fnsrankslarg]
     sis←(E'$YRANK')Strepl¨ER1(mcb sis),mcb crks[;fnsranksrarg]
     sis←(E'$ZCELLSHAPE')Strepl¨ER1(mcb sis),mcb zcshp
     sis←sis EmitPrimitiveFnDefnsTemplateFiller fns2
     sis←sis InsertSysvarHeader GenSysvarArgs fns2
     fns←(~cv)⌿fns
 :EndIf
 r←(E sis),E fns
