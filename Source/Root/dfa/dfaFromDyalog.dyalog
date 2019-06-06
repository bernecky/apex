 r←dfaFromDyalog y;ast;wl;i;j;k;astr;p;lh;rh;cv
 ⍝ Handle Dyalog version of From (I do not know how it compares to the
 ⍝ J/SHARP APL From, so here is a fresh start.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E,'⌷' ⍝ Index  x⌷y
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     astr←i⌿ast
     rh←D astr[;astrarg] ⍝ Array being indexed
     'Scalar ⍵ for From'assert∧/0≠D ast[rh;astrank]
     astr[;asttype]←ast[rh;asttype] ⍝ Result type is rhtype
     lh←D astr[;astlarg] ⍝ Index arrays
  ⍝ Result rank is (⍴⍴x)+¯1+⍴⍴y
     p←(~ast[lh;astrank]∊NULL)∧~ast[rh;astrank]∊NULL ⍝ Know both?
     j←0⌈p/ast[lh;astrank]+ast[rh;astrank]-1
     astr[p/⍳⍴p;astrank]←ER0 j
  ⍝ Result shape is (⍴x),¯1↓⍴y
     p←(~ast[lh;astshape]∊NULL)∧~ast[rh;astshape]∊NULL
     j←ast[lh;astshape],¨¯1↓¨ast[rh;astshape]
     astr[p/⍳⍴p;astshape]←p/j
  ⍝ Predicate maintenance
     p←D ast[rh;astPred] ⍝ Indexing kills most predicates
     p[;astPredPVSubset]←p[;astPredPVSubset]∨p[;astPredPV]
     k←(⍴p)⍴0
     k[;astPredAll2,astPredPVSubset,astPredNonNeg,astPredInteger]←1
     astr[;astPred]←ER1 p∧k
     j←astmerge(E ast),(E astr),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
