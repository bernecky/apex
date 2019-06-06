 r←EmitRankCellRanks fns;a09;xyrk;fnrk
⍝ Generate cell ranks of subfunction f in "f rank rks". as 'fns-rks'
 a09←'0123456789'
 fnrk←a09⍳D fns[;fnsnuaxk]
 xyrk←a09⍳0 ¯1↓D fns[;fnsranks]
 r←xyrk⌊fnrk
