 r←dfaRoll y;ast;wl;i;j;k
 ⍝ dfa for roll
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊E,'?')∧NULL=ast[;astlarg]
 wl←wl∧~i ⍝ Mark our work done
 :If 1∊i ⍝ Any work?
     j←ast[i/⍳⍴i;] ⍝ Our ast rows
     j[;asttype]←E asttypeI
     j[;astrank]←ast[D j[;astrarg];astrank]
     j[;astshape]←ast[D j[;astrarg];astshape]
     j←astmerge(E ast),(E j),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
     k←astPredLen⍴0 ⍝ Set predicates
     k[astPredPV,astPredNoDups]←1
     k[astPredNonNeg,astPredInteger]←1
     ast[i/⍳⍴i;astPred]←E k
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
