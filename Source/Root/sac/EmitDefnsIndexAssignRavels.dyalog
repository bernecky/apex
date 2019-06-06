﻿ r←mil EmitDefnsIndexAssignRavels fns;tps;cv;nul;nms;cols;rks
⍝# Emit ravel statements for indexed assign index lists
⍝ mil[;k]>0: real index list
⍝ mil[;k]=0: dummy trailing entry
⍝ mil[;k]<0: elided index
 tps←0 3↓D fns[;fnstypes]
 rks←0 3↓D fns[;fnsranks]
 nul←tps∊'x'
 cv←(~nul)∧tps∊Types
 r←(⍴cv)⍴E'=reshape([prod(shape('
 cols←⍕¨(⍴cv)⍴⍳¯1↑⍴cv
 nms←(E'I'),¨cols
 r←nms,¨r,¨nms
 r←,r,¨(E'))],'),¨nms,¨E');',NL
 r[(,rks∊'01')/⍳⍴r]←E'' ⍝ Don't ravel vectors or scalars
 r[(,nul∨~cv)/⍳⍴r]←E''  ⍝ Remove trash entries
 r←Raze⍉(⍴cv)⍴r
