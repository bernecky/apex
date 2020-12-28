﻿ r←tp TypeRank rk;lft;rt
⍝ This uses ast or fns arguments.
⍝ Return TargetLanguage type and rank specifier for
⍝ arguments of type tp and rank rk,
⍝ e.g.,    'i' TypeRank '2'
⍝     array[array[integer]]  for SISAL, and
⍝     [.,.] for SAC
 :Select #.globals.TargetLanguage
 :Case 'sisal'
     r←tp SISALTypeRank rk
 :Case 'sac'
     r←tp SACTypeRank rk
 :Case 'plural'
     r←tp PLURALTYpeRank rk
 :EndSelect
