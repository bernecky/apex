﻿ r←frg EmitDefnsIndexRef fns;ctl;cv;cvm;tp;fns2;sis;rk
 ⍝ Emit SAC function defns for indexed reference: X[i]
 sis←''
 :If ~0∊⍴fns
     ctl←7 FragmentCode frg
  ⍝ indr ranks for (Z←) X[Ijk] (←Y) are:  XYZIjk
     fns2←fns              ⍝ Fake it to look like: XIZ
     fns2[;fnsranks]←ER1((D fns2[;fnsranks]),' ')[;fnsrankslarg,3 2]
     cvm←<\(ctl FindFn fns2)∧ctl FindRankGen fns2
     cv←∨/cvm
     :If 1∊cv ⍝ Any work?
         tp←(D(cv⌿fns)[;fnstypes])[;fnstypeslarg] ⍝ type of X
         rk←(D(cv⌿fns)[;fnsranks])[;fnstypeslarg] ⍝ Rank of X
         sis←ctl Getsis cvm
         sis←(E'$XTYPE')Strepl¨ER1(mcb sis),mcb tp TypeRank rk
         sis←(E'$ZTYPE')Strepl¨ER1(mcb sis),mcb tp TypeRank rk
         sis←(E'$XT')Strepl¨ER1(mcb sis),mcb TS tp
         sis←sis SetFill tp
         sis←nub sis ⍝ Remove dups (easier now than before).
         cv←cv∨fns[;fnsfn]∊E'semi' ⍝ Delete indices
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
