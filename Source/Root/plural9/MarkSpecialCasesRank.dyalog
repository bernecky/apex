﻿ r←ast MarkSpecialCasesRank fns;ctl;cvm;cv;frks;case;crks;opnd;cellrk;rks
 ctl←7 FragmentCode'mdrank'
 cvm←(ctl FindFnOnly fns)∧ctl FindRankGen fns
 cv←∨/<\cvm
 r←fns
 :If 1∊cv                           ⍝ Any work?
     opnd←D cv⌿ast[;astlop]             ⍝ F"k
     cellrk←D ast[opnd;astlarg,astrarg] ⍝ k
     rks←ER1 RANKS D ast[cellrk;astrank]
     r[cv/⍳⍴cv;fnsnuaxk]←rks
     frks←EmitRankFrameRanks cv⌿r
     case←((E,'.'),(E'EXTX'),(E'EXTY'),(E,'.'))[2⊥×⍉frks]
     r[cv/⍳⍴cv;fnsspec]←case
 :EndIf
