﻿ r←dfaMrho y;ast;wl;i;j;k;newrows;b
 ⍝ dfa for "shape" -- monadic rho.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astlarg,astfn]matchR1 NULL,E,'⍴'
 wl←wl∧~i
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 ⍝ Must know right rank
 i←i∧i\~ast[,D(i⌿ast)[;astrarg];astrank]∊NULL
 :If 1∊i
     newrows←i⌿ast
     j←D newrows[;astrarg] ⍝ Argument to shape
     k←ast[j;] ⍝ Known shapes
     newrows[;astshape]←,¨k[;astrank]
     newrows[;astxrho]←(E⍳0)⍴¨k[;astrank]
     newrows[;astrank]←E 1 ⍝ Vector result
     newrows[;asttype]←asttypeI ⍝ Integer result
     j←~k[;astshape]∊NULL ⍝ Know shape of ⍵?
  ⍝ Result is arg shape
     newrows[j/⍳+/i;astvalue]←⍕¨j⌿k[;astshape]
     k←((+/j),astPredLen)⍴0 ⍝ Set predicates
     k[;astPredNonNeg,astPredInteger]←1
     k[;astPredKnowValue]←1
     newrows[j/⍳⍴j;astPred]←ER1 k
     j←astmerge(E ast),(E newrows),E i
     ast←D j[0]
     wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
