 r←PlacePhiFunctions y;i;j;st;ast;bb;phi;n;p;k
 ⍝ From Michael Wolfe , 1992
 ⍝ "High Performance Compliers", p 182
 ast←D y[ssaast]
 bb←D y[ssabb]
 ⍝ The only variables needing phi fns are those
 ⍝ with multiple assigments to them. We consider
 ⍝ the parameters and incoming globals as having
 ⍝ an assignment already. 1996-03-10
 i←((NamedAssigns ast)⌿ast)[;asttarget]
 i←i,(ast[;astscope]∊astscopeSGI+0,astscopeSGO)/⍳1↑⍴ast
 i←i,dfnlarg,dfnrarg
 i←dups i
 ⍝
 p←(E y)PlacePhiFunction¨ER0 i
 n←D Raze p ⍝ Where Phi fns needed
 :If ~0∊⍴n
     phi←(j←,D⍴¨p)⌿ast[D i;]
     phi[;astfn]←E':PHI'
     phi[;astclass]←astclassVARB
  ⍝ Fix args and targets & order by bb#
     k←3/⍪j/i
     phi[;asttarget,astlarg,astrarg]←k
     phi←phi[⍋n;]
  ⍝ Count # phi fns per basic block
     n←1+bb\+/(⍳+/bb)∘.=n
  ⍝ Expand ast and bb
     ast←(¯1++\n)RenumberAst ast ⍝ Renumber indices
     ast←n⌿ast
     bb←n/bb ⋄ n←(n-1)/⍳⍴n ⋄ n←n+1+⍳⍴n ⋄ bb[n]←0
     ast[n;]←phi
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssabb]←E bb
