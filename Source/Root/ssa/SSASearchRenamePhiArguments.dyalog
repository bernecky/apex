 r←x SSASearchRenamePhiArguments yy;ast;bb;cfg;curnode;cv2;i;j;S;tar;X;Y
 ⍝ SSA Search from Wolfe 1992, p. 183
 ⍝ This only handles ONE target verb, tar
 X←D x[0] ⋄ tar←D x[1] ⍝ Vars,target varb
 y←D yy[0] ⍝ SSA Stuff
 S←D yy[1]⍝ S is rename stack.
 ⍝   yy[2]    is available name list.
 ast←D y[ssaast] ⋄ cfg←D y[ssacfg]
 bb←D y[ssabb]
 ⍝ (3) Rename PHI arguments of successors
 ⍝ Loop over cfg successors
 Y←cfg[X;] ⋄ Y←Y/⍳⍴Y
 :For curnode :In Y
     j←cfg WhichPred2 curnode,X
  ⍝ For each PHI function in Y do
  ⍝ replace jTH operand by top
  ⍝
  ⍝ 1995-09-14: Attempt to fix index error caused by
  ⍝ :For/:PHI in same bb, of variable T, when T is not
  ⍝ defined in an earlier bb
  ⍝ This should all be obsolete, as we now define
  ⍝ initial values for value errors. 1995-09-19.
  ⍝ Nonetheless, we'll kill it later.
     cv2←bb BBn curnode
     cv2←cv2\(cv2⌿ast)[;astfn]∊E':PHI' ⍝ Find phi fns
     cv2←cv2\∨/(cv2⌿ast)[;astlarg,astrarg]∊tar ⍝ Just ours
     cv2←cv2/⍳⍴cv2
 ⍝⍝⍝  cv2←(~tar∊ast[cv2;asttarget])/cv2 ⍝ 1995-09-14
 ⍝ if astlarg is an argument or semiglobalin, we must
 ⍝ leave it as is. 1996-03-10
     :If 0≠⍴cv2 ⍝ Avoid index error on next line if no :PHI
         i←ER0 ast[;asttarget]⍳S[0]
  ⍝ 1996-04-08 Attempt to fix bug in benchscs "for initial"
  ⍝ We hope to simplify things by placing the ast index
  ⍝ of the name, rather than the ast row that creates
  ⍝ the name.
         i←ast FindReferentNew i
         i←(i,S[0])[i=cv2] ⍝ It's a parameter (or value error!)
         'Missed a reference'assert∧/i<1↑⍴ast
         ast[cv2;(astlarg,astrarg)[j]]←i
     :EndIf
 :EndFor
⍝
 r←y ⋄ r[ssaast]←E ast
 r←(E r),(E S),yy[2]
