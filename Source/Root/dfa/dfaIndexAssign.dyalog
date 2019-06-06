﻿ r←dfaIndexAssign y;ast;wl;i;j;k;astr;p;rhs;lhs
 ⍝ Handle indexed assign
 ⍝ astlarg[astrarg...]←astrop
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E,']' ⍝Indexed assign
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     astr←i⌿ast
     lhs←ast[D astr[;astlarg];] ⍝ lhs[i]←rhs
     rhs←ast[D astr[;astrop];]
 ⍝ Result type is max of argument type, rhs type
     j←rhs[;,asttype] ⍝ Index datatype
     k←lhs[;,asttype] ⍝ Target datatype
     astr[;asttype]←j maxtype k
     astr[;astrank]←lhs[;astrank] ⍝ Result rank is target rank
 ⍝ Invalidate most predicates
     p←((1↑⍴astr),astPredLen)⍴0 ⍝ Invalidate most predicates
     p[;astPredAll2,astPredNonNeg,astPredInteger]←1
     astr[;astPred]←ER1 p∧(D astr[;astPred])∧D rhs[;astPred]
     j←astmerge(E ast),(E astr),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
