﻿ r←EmitFnCallsPA y;fns;cv;lht;rht;zt;cal;t;ast
⍝# Emit function calls for adv/conj :PA entries
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 cv←MarkPAEntries ast
 cal[cv/⍳⍴cv;]←E''
 fns[cv/⍳⍴cv;]←E''
 r←y
 r[2]←E fns
 r[3]←E cal
