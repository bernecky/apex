﻿ r←dfaRotr y;ast;wl;i;j;k;astr;p;s;rarg
 ⍝ Handle rotate and reverse.
 ⍝ Type, rank & shape match right arg.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊ER1⍪'⌽⊖' ⍝ Get dyadic and monadic ones.
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     astr←i⌿ast
     rarg←D astr[;astrarg] ⍝ Right arg(s)
     j←asttype,astrank,astshape,astclass,astxrho
     astr[;j]←ast[rarg;j]
     p←D ast[rarg;astPred] ⍝ Update predicates
     k←(⍴p)⍴0
     k[;astPredPV,astPredPVSubset,astPredAll2,astPredNoDups]←1
     k[;astPredNonNeg,astPredInteger]←1
  ⍝ For reverse, invert sense of sortedness
     s←astr[;astlarg,astlarg]∊NULL ⍝ Fix sortedness for ⌽⍵
     s←s∧k[;astPredSortedUp,astPredSortedDown]
     k[;astPredSortedDown,astPredSortedUp]←s
     astr[;astPred]←ER1 p∧k
     j←astmerge(E ast),(E astr),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
     ast←ast JoinShapeClique(i/⍳⍴i),⍪rarg
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
