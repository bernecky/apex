﻿ r←dfaEps y;ast;wl;i;j;k;p
 ⍝ Handle set membership
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊ER1⍪'∊')∧~ast[;astlarg]∊NULL
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     j←i⌿ast ⍝ Our rows of ast
     j[;asttype]←asttypeB ⍝ Result is Boolean
  ⍝ Set result rank and type, if known.
     k←D j[;,astlarg] ⍝ Locate ⍺.
     j[;astrank,astshape]←ast[k;astrank,astshape]
     p←astPredLen⍴0 ⍝ Set new predicates
     p[astPredNonNeg,astPredInteger]←1
     j[;astPred]←E p
     j←astmerge(E ast),(E j),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
