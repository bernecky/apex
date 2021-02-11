 r←dfaMiota y;ast;wl;i;j;k;m;b
 ⍝ Handle monadic iota.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊(E,'#'),E,'⍳')∧ast[;astlarg]∊NULL
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     j←i⌿ast ⍝ Integer vector result
     j[;asttype,astrank]←((1↑⍴j),2)⍴asttypeI,E 1
  ⍝ If argument is constant, result is known
  ⍝ Ignoring ⎕io troubles, of course...
     k←D j[;astrarg] ⍝ ⍵
     m←ast KnowValue k ⍝ Know these values?
     b←m/⍳⍴m ⍝Shape is value y
     :If 0≠⍴b ⍝ Stupid ×/¨ won't work on empties!
         j[b;astshape]←,¨quadfi¨ast[m/k;astvalue]
         j[b;astxrho]←(E⍳0)⍴¨×/¨j[b;astshape]
     :EndIf
   ⍝⍝⍝ j[b;astvalue]←⍳¨j[m/⍳⍴m;astshape] ⍝ Value is ⍳n. ⎕io troubles!
   ⍝ 1996-12-13 Can't predict value without knowing ⎕io. This kills dbt1
     k←astPredLen⍴0 ⍝ Set predicates
     k[astPredPV,astPredSortedUp,astPredNoDups]←1
     k[astPredNonNeg,astPredInteger]←1
     j[;astPred]←E k
   ⍝⍝⍝⍝⍝⍝⍝ 1996-12-13  k[astPredKnowValue]←1 ⍝ For those choice few
     j[b;astPred]←E k
     j←astmerge(E ast),(E j),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
  ⍝ ⍵ must be singleton
     k←nub D i⌿ast[;astrarg]
     k←k[⍋k] ⍝ Ordered, please
     j←ast[k;] ⍝ ⍵
     j[;astxrho]←1
     j←astmerge(E ast),(E j),E(⍳1↑⍴ast)∊k
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
