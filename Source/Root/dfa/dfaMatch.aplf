 r←dfaMatch y;ast;wl;i;j;astr
 ⍝ Handle dyadic ≡ -- match
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊ER1⍪'≡')∧~ast[;astlarg]∊NULL
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     j←asttypeB,(E 0),(E⍳0),E 1 ⍝ Boolean scalar result
     astr←i⌿ast
     astr[;asttype,astrank,astshape,astxrho]←((+/i),4)⍴j
  ⍝ Update predicates
     j←astPredLen⍴0
     j[astPredSortedUp,astPredNonNeg,astPredInteger]←1
     astr[;astPred]←E j
     j←astmerge(E ast),(E astr),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
