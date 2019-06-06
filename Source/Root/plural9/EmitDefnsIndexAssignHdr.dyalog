﻿ r←mil EmitDefnsIndexAssignHdr fns;tps;rks;cv;nul
⍝# Emit Index list header types for indexed assign
 tps←0 3↓D fns[;fnstypes]
 rks←0 3↓D fns[;fnsranks]
 nul←tps∊'x'
 cv←(~nul)∧tps∊Types
 tps←(⍴tps)⍴E'int '
 rks←((E'[+]'),E'')[rks='0'] ⍝ Scalar indices remain scalar
 r←tps,¨rks,¨E' '
 r←,r,¨(E'I'),¨⍕¨(⍴r)⍴⍳¯1↑⍴r
 r[(,nul∨~cv)/⍳⍴r]←E''
 r←','InsertInterAxisCommas(⍴mil)⍴r
 r←r,((E''),E',')[∨/cv]      ⍝ append end-of-index list comma
 r←Raze⍉r
