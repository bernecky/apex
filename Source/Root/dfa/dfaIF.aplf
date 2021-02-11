 r←dfaIF y;ast;wl;i;j;k;b;n
 ⍝ Handle Dyalog :if/:else/:endif
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊(E':If'),(E':EndIf'),E':Else'
 wl←wl∧~i ⍝ Update worklist
 :If 1∊i ⍝ Any work?
     j←D(i⌿ast)[;astrarg]
     k←i⌿ast
     ∘
  ⍝ Type of N in :for N :in Y is type of Y
     k[;asttype]←ast[j;asttype]
  ⍝ Rank of N in :for N :in Y is 0⌈(rank of Y)-1
     k[;astrank]←0⌈¯1+ast[j;astrank]
     j←astmerge(E ast),(E k),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
  ⍝ Now merge the updated ast info into the
  ⍝ targets N of the :for expressions
     i←D k[;asttarget] ⋄ n←ast[i;] ⍝ N and S.T. entries
     n[;astchar]←k[;astchar]
     b←(⍳⍴wl)∊i ⍝Mark rows
     j←astmerge(E ast),(E n),E b
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
