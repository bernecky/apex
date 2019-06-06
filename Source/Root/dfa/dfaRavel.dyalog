﻿ r←dfaRavel y;ast;wl;i;j;k;b;m;p;cv;shp;val
 ⍝ Ravel and table.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊ER1⍪',⍪' ⍝
 i←i∧ast[;astlarg]∊NULL ⍝ Monadic only, please.
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
  ⍝ Shape is ×/⍴shape of rh if known. Value is
  ⍝ ravel of value if known
     j←i⌿ast ⍝ The modified rows
     k←D(i⌿ast)[;astrarg] ⍝ Right arguments
     j[;asttype]←ast[k;asttype] ⍝ Result type is arg type
     b←j[;astfn]∊ER1⍪'⍪' ⍝ Mark table ops
     j[;astrank]←ER0 b+1 ⍝ Result rank 1 for ravel, 2 for table
     cv←~ast[k;astshape]∊NULL ⍝ Right argument has known shape
     :If 1∊cv ⍝ Stupid APL2 prototypes
         shp←×/¨cv/ast[k;astshape]
         shp←shp,¨((E⍳0),E 1)[b] ⍝ ravel vs. table
         j[cv/⍳⍴cv;astshape]←cv/shp
     :EndIf
     ⍝
     cv←~ast[k;astvalue]∊NULL ⍝ Right argument has known value
     ⍝ Not sure if astvalue is ⍕value or ⍕,value...
     val←cv/ast[k;astvalue]
     j[cv/⍳⍴cv;astvalue]←val
     ⍝
     j[;astclass]←astclassVARB
     p←astPredLen⍴0           ⍝ Maintain predicates
     p[astPredAll2,astPredPV,astPredPVSubset]←1
     p[astPredSortedUp,astPredSortedDown]←1
     p[astPredNoDups,astPredNonNeg,astPredInteger]←1
     p[astPredKnowValue]←1
  ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝ THIS SHOULD WORK BUT NOT YET.
  ⍝  IT NEEDS partial evaluation...  p[astPredKnowValue]←1
     b←D ast[k;astPred]
     j[;astPred]←ER1 b∧(⍴b)⍴p
     j←astmerge(E ast),(E j),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
