﻿ r←dfaExpand y;ast;wl;i;j;k;larg;rarg;p;astr;zs
 ⍝# DFA for expand.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊ER1⍪'\⍀')∧(~ast[;astlarg]∊NULL)∧ast[;astlop]∊NULL
 i←i∧(isnum ast[;astlarg])∧~ast[;astlarg]∊NULL
 j←astclassGFN,astclassDFN,astclassMFN,astclassLFN
 i←i\~ast[D i⌿ast[;astlarg];astclass]∊j ⍝ Not a fn
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     astr←i⌿ast
 ⍝ Result type is type ⍵
     larg←D astr[;astlarg] ⍝ ⍺
     rarg←D astr[;astrarg] ⍝ ⍵
     astr[;asttype]←ast[rarg;asttype]
 ⍝ Result rank is rank ⍵, usually.
 ⍝ If ⍵ is scalar, result is vector.
     astr[;astrank]←ER0 1⌈D ast[rarg;,astrank]
 ⍝ If we know both argument shapes, we can
 ⍝ determine result shape.
     j←∧/~ast[(mcb larg),rarg;astshape]∊NULL
     zs←j∧astr[;astfn]∊E,'\'    ⍝ Last axis
     astr[zs/⍳⍴zs;astshape]←(1↓¨ast[zs/rarg;astshape]),¨ast[zs/larg;astshape]
     zs←j∧astr[;astfn]∊E,'⍀'    ⍝ First axis
     astr[zs/⍳⍴zs;astshape]←ast[zs/larg;astshape],¨1↓¨ast[zs/rarg;astshape]
 ⍝ Maintain predicates
     p←astPredLen⍴0
     p[astPredInteger,astPredNonNeg]←1
     k←D ast[rarg;astPred]
     astr[;astPred]←ER1 k∧(⍴k)⍴p
     j←astmerge(E ast),(E astr),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
