﻿ r←dfaSubFunctions y;ast;wl;i;cv
 ⍝ Handle function calls in a fn
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←astclassGFN,astclassMFN,astclassDFN,astclassNFN ⍝ Defined fns
 cv←((~dfainit ast)⌿ast)[;astclass]∊i
 cv←cv/⍳⍴cv
 i←wl∧ast[;astfn]∊cv ⍝ Defined fn work happens in dfaUpDown
 wl←wl∧~i
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
