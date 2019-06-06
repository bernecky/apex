﻿ r←dfaCatenate y;ast;wl;i;j;k;m;n;p;s;b;c
 ⍝ Handle catenation.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊ER1⍪'⍪,')∧~ast[;astlarg]∊NULL
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If (1∊i) ⍝ Any work?
     k←D(i⌿ast)[;astlarg,astrarg] ⍝ ⍺ and ⍵.
 ⍝ Type is maxtype of both arguments.
     j←ast[k;asttype] ⍝ Types
     m←~∨/j∊NULL ⍝ Both types known.
     j←asttypeB maxtype m⌿j
     b←i∧i\m ⋄ c←b⌿ast
     c[;asttype]←j
     j←astmerge(E ast),(E c),E b
     ast←D j[0] ⋄ wl←wl∨D j[1]
 ⍝ Must know rank of both arguments
     j←ast[k;astrank] ⍝ ⍺,⍵ ranks.
     m←~∨/j∊NULL
     i←i∧i\m
     k←m⌿k
 ⍝ Result rank is 1⌈(⍴⍴⍺)⌈⍴⍴⍵.
     j←i⌿ast
     :If (~0∊⍴j) ⍝ Kinda stuck here
         m←D ast[k;astrank] ⍝ Argument ranks
         j[;astrank]←ER0 1⌈⌈/0,m ⍝ 0 in case m now empty
 ⍝ Result shape is harder.
 ⍝ If both scalar, result is two-element vector.
         j[(m∧.=0)/⍳1↑⍴j;astshape]←E,2 ⍝ s,s
 ⍝ Scalar, known-length vector.
         n←∨/m∧.=⍉3 2⍴0 1 1 0 1 1 ⍝ s,v ; v,s ; v,v
         p←ast[k;astshape] ⍝ Argument shapes
         m←∧/~p∊NULL ⍝ Mark known shapes
         p←,p ⋄ p[(p∊E⍳0)/⍳⍴p]←E 1 ⋄ p←(⍴k)⍴p ⍝ Scalars are 1-element
         s←n∧m ⍝ Know both shapes, got right ranks
 ⍝ Get result shape
 ⍝ FIXME WRONG for ⍪ !!
         j[s/⍳⍴s;astshape]←ER1+/[1]D s⌿p
 ⍝ Maintain predicates
         p←astPredLen⍴0
 ⍝ The following predicates are propagated if they are
 ⍝ true for both (known) arguments.
 ⍝ Partial evaluator will eventually set astPredKnowValue
 ⍝ and a few others for constants.
         p[astPredAll2,astPredNonNeg,astPredInteger]←1
         n←(D ast[k[;1];astPred])∧D ast[k[;0];astPred]
         j[;astPred]←ER1 n∧(⍴n)⍴p
         j←astmerge(E ast),(E j),E i
         ast←D j[0] ⋄ wl←wl∨D j[1]
     :EndIf ⍝ kinda stuck here
 :EndIf ⍝ any work?
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
