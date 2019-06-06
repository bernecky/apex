 r←dfaDeal y;ast;wl;i;j;k
 ⍝ dfa for deal
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊E,'?')∧NULL≠ast[;astlarg]
 wl←wl∧~i ⍝ Mark our work done
 :If 1∊i ⍝ Any work?
     j←ast[i/⍳⍴i;] ⍝ Our ast rows
     j[;asttype]←E asttypeI
     j[;astrank]←E 1
     k←astPredLen⍴0 ⍝ Set predicates
     k[astPredPV,astPredNoDups]←1
     k[astPredNonNeg,astPredInteger]←1
     j[;astPred]←E k
 ⍝ We could set astshape if we know larg value... rbe 2004-10-05
     j←astmerge(E ast),(E j),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
