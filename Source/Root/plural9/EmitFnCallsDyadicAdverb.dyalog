﻿ r←EmitFnCallsDyadicAdverb y;ast;nms;ctl;prim;fn;n;f;lp;gfn;grt;i;loc;nc;nl;lt;fn;rnk;j;t;kt;cv;nm;sis;ast;cv;fns;cal
 r←y
 →0 ⍝⍝⍝⍝⍝⍝⍝⍝ DEAD
 ⍝ Emit dyadic adverb calls for NON-primitive
 ast←D y[0] ⋄ cv←D y[1] ⋄ fns←D y[2] ⋄ cal←D y[3]
⍝ Window reduction only today 1995-10-29
 cv←ast[;astfn]∊ER1 mcb'/⌿\⍀'
 cv←cv∧~ast[;astlarg]∊NULL ⍝ Dyadic derived fns
 cv←cv∧isnum ast[;astlop] ⍝ Non-primitives only
 sis←E''
 →(0=∨/cv)⍴lz
 ∘
lz:r←y
