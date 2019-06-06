﻿ r←tp TypeRank rk;lft;rt;rks;tps
⍝ This uses ast or fns arguments.
⍝ Return TargetLanguage type and rank specifier for
⍝ arguments of type tp and rank rk,
⍝ e.g.,    'i' TypeRank '2'
⍝     array[array[integer]]  for SISAL, and
⍝     [.,.] for SAC
 :If IsChar rk
     rks←,'0123456789'⍳rk
     rks[(rks=11)/⍳⍴rks]←¯1
     rks←(⍴rk)⍴rks
 :Else
     rks←rk
 :EndIf
 rks←⍪,rks
 :If IsChar tp
     tps←TypesBig⍳tp
 :Else
     tps←tp
 :EndIf
 tps←⍪,tps
 :Select TargetLanguage
 :Case 'sisal'
     r←tps SISALTypeRank rks
 :Case 'sac'
     r←tps SACTypeRank rks
 :Case 'plural'
     r←tps PLURALTypeRank rks
 :Else
     ⎕←'No TypeRank for TargetLanguage: ',TargetLanguage
     ÷0

 :EndSelect
 r←(⍴rk)⍴r
