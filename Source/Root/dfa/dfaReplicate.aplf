 r←dfaReplicate y;ast;wl;i;j;k;cv;p;n
 ⍝ Handle replicate.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊ER1⍪'/⌿')∧isnum ast[;astlop]
 i←i∧ast[;astlop]∊NULL ⍝ Ignore all reductions
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work
     j←i⌿ast ⍝ ⍵ ⍝ Result shape is type ⍵
     k←D j[;astrarg] ⍝ ⍵
     j[;asttype]←ast[k;asttype]
 ⍝ Result rank is rank ⍵, usually.
 ⍝ If ⍵ is scalar, result is vector of shape ,1
     cv←~ast[k;astrank]∊NULL ⍝ Only if we know its value
     j[cv/⍳⍴cv;astrank]←cv/ER0 1⌈D ast[k;astrank]
     j[cv/⍳⍴cv;astshape]←cv/E,1
 ⍝
 ⍝ Maintain predicates
     p←astPredLen⍴0
     p[astPredAll2,astPredSortedUp,astPredSortedDown]←1
     p[astPredNonNeg,astPredInteger]←1
     n←D ast[k;astPred]
     j[;astPred]←ER1 n∧(⍴n)⍴p ⍝ Maintain Predicates
     j←astmerge(E ast),(E j),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
