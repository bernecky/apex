﻿ r←dfaGrade y;i;ast;wl;j;k;p
 ⍝ "Known result characteristics"
 ⍝ Set result rank and type of grade.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊ER1⍪'⍒⍋'
⍝⍝ i←i∧ast[;astlarg]∊NULL ⍝ Monadic only, please.
 wl←wl∧~i ⍝ Mark work already done.
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
  ⍝ Set characteristics of integer vectors
     k←i⌿ast
     k[;astclass]←astclassVARB
     k[;asttype]←asttypeI
     k[;astrank]←E 1
     p←astPredLen⍴0 ⍝ Establish predicates
     p[astPredPV,astPredNoDups,astPredNonNeg,astPredInteger]←1
     k[;astPred]←E p
     j←astmerge(E ast),(E k),E i
     ast←D j[0]
     wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
