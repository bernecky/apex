﻿ r←dfaQuadts y;i;ast;wl;k
 ⍝ Set result type, rank, shape for ⎕ts
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E'⎕ts'
 wl←wl∧~i ⍝ Mark work already done.
 :If 1∊i ⍝ Any work?
     k←i⌿ast
     k[;asttype]←asttypeI
     k[;astrank]←E 1
     k[;astshape]←E,7
     j←astmerge(E ast),(E k),E i
     ast←D j[0]
     wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
