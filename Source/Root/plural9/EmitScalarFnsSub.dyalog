﻿ r←frag EmitScalarFnsSub fns;sis;ctl;cvm;cv
⍝# Subfn that actually emits scalar fn code (SxA, AxS, AxA)
⍝# Called for scalar fns, inner products, etc.
⍝# Result is vector of sis, updated fns
 sis←''
 ctl←6 FragmentCode frag ⍝ Get appropriate control fragment
 cvm←<\(ctl FindFnOnly(⍴fns)⍴E frag)∧ctl FindRankGen fns
 cv←∨/cvm
 :If 1∊cv   ⍝ Any work?
     sis←ctl Getsis cvm
     fns←cv⌿fns
     sis←sis EmitPrimitiveFnDefnsTemplateFiller fns
     sis←sis InsertSysvarHeader GenSysvarArgs fns
     fns←(~cv)⌿fns
 :EndIf ⍝ Any work?
 r←(E sis),E fns
