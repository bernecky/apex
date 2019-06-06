﻿ r←dfaMsf y;ast;wl;i;j;k;m;types;t;rt;rarg
 ⍝ Handle monadic scalar functions.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astlarg]∊NULL)∧ast[;astfn]∊ER1⍪'+-÷×*○⌈⌊⍟|~'
 wl←wl∧~i ⍝ Mark work done
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     j←i⌿ast ⍝ Affected rows.
 ⍝ Argument type, rank, shape
     rarg←D j[;astrarg]
     k←ast[rarg;asttype,astrank,astshape]
     rt←k[;0] ⍝ Right argument types
 ⍝ Result type same as argument usually.
     j[;asttype,astrank,astshape]←k
     k←j[;astfn]∊E,'~'        ⍝ Forced Boolean type, e.g., ~Integer
     j[k/⍳⍴k;asttype]←asttypeB
 ⍝ Forced promotions, e.g, -Boolean → integer
 ⍝ has minimum type Integer
     k←(ER1⍪'÷○⍟*-')⍳j[;astfn] ⍝ Minimum type
     types←(4⍴asttypeD),asttypeI
     t←(k<⍴types)∧~rt∊NULL
     j[t/⍳⍴t;asttype]←j[t/⍳⍴t;asttype]⌈types[t/k]
 ⍝ Forced demotions, e.g., ×Double_real → integer
     k←j[;astfn]∊ER1⍪'×⌊⌈'
     j[k/⍳⍴k;asttype]←j[k/⍳⍴k;asttype]⌊asttypeI
     j[;astPred]←E astPredLen⍴0 ⍝ Kill all predicates
     j←astmerge(E ast),(E j),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
     ast←ast JoinShapeClique(i/⍳⍴i),⍪rarg
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
