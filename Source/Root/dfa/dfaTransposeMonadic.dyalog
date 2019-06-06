﻿ r←dfaTransposeMonadic y;ast;wl;i;j;k;newrows;m;la;n;p
 ⍝ Handle monadic transpose
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊E,'⍉')∧IsMonadic ast
 wl←wl∧~i
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     m←ast[;astlarg]∊NULL
     newrows←(i∧m)⌿ast
     k←,D newrows[;astrarg] ⍝ Right argument.
  ⍝ Result type and rank same as right argument
     newrows[;asttype,astrank]←ast[k;asttype,astrank]
  ⍝ Result shape is reverse of argument shape.
     newrows[;astshape]←⌽¨ast[k;astshape]
     k←astPredLen⍴0
     k[astPredPV,astPredAll2,astPredPVSubset]←1
     k[astPredNoDups,astPredNonNeg,astPredInteger]←1
  ⍝ Should be able to prop astPredKnowValue, except
  ⍝ we need partial evaluation here.
     n←D newrows[;astPred]
     newrows[;astPred]←ER1 n∧(⍴n)⍴k
     j←astmerge(E ast),(E newrows),E i∧m
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
