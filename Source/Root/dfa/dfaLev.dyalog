 r←dfaLev wp;ast;wl;i;j;k
 ⍝ dfa for lev primitive
 ast←D wp[ssaast]
 wl←D wp[ssacv]
 i←wl∧(ast[;astfn]∊E,'⊣')∧~ast[;astlarg]∊NULL ⍝ Dyadic Lev
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 wl←wl∧~i ⍝ Mark work done
 :If 1∊i ⍝ Any work?
  ⍝ Result is left argument.
     k←i⌿ast
     k[;astchar]←ast[D i⌿ast[;astlarg];astchar]
     j←astmerge(E ast),(E k),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
