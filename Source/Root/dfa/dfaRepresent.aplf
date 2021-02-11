 r←dfaRepresent y;ast;wl;i;j;k;m;n;p
 ⍝ Handle Represent (x⊤y)
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E,'⊤' ⍝ Represent
 i←i\~(i/ast[;astlarg])∊NULL ⍝ Dyadics only
 wl←wl∧~i ⍝ Update worklist
⍝⍝⍝⍝⍝ i←i∧~(D ast[;astPred])[;astPredKnowValue] ⍝ was speeder uppper?
 :If 1∊i ⍝ Any work?
     j←i⌿ast ⍝ Affected rows.
     k←ast[D j[;astlarg,astrarg];] ⍝ Arguments.
  ⍝ Result type needs both types.
     m←∧/~k[;;asttype]∊NULL
     n←dfaRepresentType m⌿k ⍝ Get result type
     j[m/⍳⍴m;asttype]←n ⍝ Result types.
  ⍝
     m←∧/~k[;;astrank]∊NULL ⍝ Need both ranks.
     k←m⌿k
     :If ~0∊⍴k ⍝ No work
         n←+/D k[;;astrank] ⍝ Result rank sum of arg ranks
         j[m/⍳⍴m;astrank]←ER0 n
   ⍝ Result shape needs to know arg shapes.
         m←∧/~k[;;astshape]∊NULL ⍝ Known arg shapes
   ⍝ Result shape is catenate of argument shapes
         j[m/⍳⍴m;astshape]←m/,/k[;;astshape]
         j[;astPred]←E astPredLen⍴0  ⍝ Kill predicates
         j←astmerge(E ast),(E j),E i
         ast←D j[0] ⋄ wl←wl∨D j[1]
     :EndIf
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
