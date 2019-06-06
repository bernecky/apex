﻿ r←dfaDyadicThorn y;ast;wl;i;astn;rarg
 ⍝ Dyadic thorn
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊ER1⍪'⍕'
 i←i∧~ast[;astlarg]∊NULL ⍝ Dyadic only, please.
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     astn←i⌿ast                 ⍝ New rows
     astn[;asttype]←E asttypeC  ⍝ Result is character
     rarg←D astn[;astrarg]
     b←~ast[rarg;astrank]∊NULL  ⍝ known argument ranks
     astn[b/⍳⍴b;astrank]←ER0(b/1)⌈ast[b/rarg;astrank] ⍝ Result rank is 1⌈⍴⍵
   ⍝ Might be able to fill in some shapes, perhaps predicates
     j←astmerge(E ast),(E astn),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
