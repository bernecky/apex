﻿ r←mil EmitDefnsIndexAssignFors fns;tps;rks;cv;nul;nms;cols;ndxsize;p
⍝# Emit FOR loop headers for indexed assign
⍝ mil[;k]>0: Loop over Ik ( X[I0;I1;...]
⍝ mil[;k]=0: nothing (garbage trailing axis)
⍝ mil[;k]<0: Loop over shape(X)[k]
 tps←0 3↓D fns[;fnstypes]
 rks←0 3↓D fns[;fnsranks]
 mil←(⍴tps)↑mil               ⍝ Discard extra trailing axes
 nul←tps∊'x'
 cv←(~nul)∧tps∊Types
 r←(⍴cv)⍴E'for('
 r←((⍴cv)⍴(⍳¯1↑⍴cv)⍴¨E' '),¨r ⍝ indenting
 cols←⍕¨(⍴cv)⍴⍳¯1↑⍴cv
 nms←(E'i'),¨cols
 r←r,¨nms,¨mcb E'=0; '
 r←r,¨nms,¨mcb E'<shape('
 ndxsize←,nms
 ndxsize[(,mil=NULL)/⍳⍴ndxsize]←E'X'
 cols←,cols
 cols[(~,mil=NULL)/⍳⍴ndxsize]←E'0' ⍝ Elided indices always vectors
 cols←(⍴cv)⍴cols
 ndxsize←(⍴nms)⍴ndxsize
 r←r,¨(UC¨ndxsize),¨(mcb E')[['),¨cols,¨E']]; '
 r←,r,¨nms,¨E'++){',NL
 p←,EmitDefnsIndexAssignMarkElidedTrailingAxes mil
 p←p∨,EmitDefnsIndexAssignMarkScalarIndices rks
 p←p∨,EmitDefnsIndexAssignMarkElidedTrailingAxes mil
 r[p/⍳⍴p]←E'' ⍝ No FOR on scalar indices or elided trailing axes
 r←Raze⍉(⍴cv)⍴r
 r[(AllScalarIndices fns)/⍳⍴r]←E'' ⍝ No loops for all-scalar indices
