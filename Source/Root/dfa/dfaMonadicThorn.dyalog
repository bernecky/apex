 r←dfaMonadicThorn y;ast;wl;i;astn;rarg;tpc
 ⍝ Monadic thorn
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊ER1⍪'⍕'
 i←i∧ast[;astlarg]∊NULL ⍝ Monadic only, please.
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     astn←i⌿ast                 ⍝ New rows
     astn[;asttype]←E asttypeC  ⍝ Result is character
     rarg←D astn[;astrarg]
     b←~ast[rarg;astrank]∊NULL  ⍝ known argument ranks
     ⍝ Result rank is 1⌈⍴⍵, except when ⍵ is character.
     tpc←asttypeC=D ast[rarg;asttype]
     astn[b/⍳⍴b;astrank]←ER0(b/~tpc)⌈ast[b/rarg;astrank]
     ⍝ Character shapes are easy
     astn[tpc/⍳⍴b;astshape]←(i\tpc)⌿ast[;astshape]
     j←astmerge(E ast),(E astn),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
