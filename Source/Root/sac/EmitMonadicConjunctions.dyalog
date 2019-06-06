﻿ r←EmitMonadicConjunctions fns;ast;nms;ctl;prim;pt;fn;n;f;sis;gfn;grt;cn;i;loc;nc;nl;gl;lt;rnk;fn;cv;t;rt;glt;cvm
 ⍝ Emit Monadic conj SAC code
 ⍝ r=genned code, new fns
 ⍝ None of these today, except determinant operator
 ctl←7 FragmentCode'mconj'
 prim←7 FragmentCode'dscalar'
 prim[;0]←¯1 dropeach prim[;0] ⍝ No trailing NL
 fn←ctl FindFnOnly nms  ⍝ Match conjs/adv
 rnk←ctl FindRank nms ⍝ Match ranks
 cvm←<\⍉rnk∧fn ⍝ Best match
 cv←∨/cvm
 sis←E''
 :If 1∊cv  ⍝ Any work?
     sis←ctl Getsis cvm
  ⍝ Insert kernels into loops.
     t←(E'$FVALUE'),(E'$YV')
     sis←(E t)DoMacro¨ER1(mcb sis),mcb f
  ⍝ Coerce right arguments
     rt←(D pt[1])[nl;,1] ⍝ Right argument types
     grt←D prim[gl;5] ⍝ Right arg fetch types
     i←rt TypeCoer grt
     i←mcb ER1 i,((1↑⍴i),3)⍴'(y)'
     sis←(E'$YV')Strepl¨ER1(mcb sis),i ⍝ Coerce y
  ⍝ Coerce left arguments
     lt←(D pt[1])[nl;,0] ⍝ Left argument type
     glt←D prim[gl;4] ⍝ Left arg fetch types
     i←,lt≠glt ⍝ Mark left coercions
     i←i⍀i⌿lt TypeCoer glt
     i←mcb ER1 i,((1↑⍴i),3)⍴'(x)'
     sis←(E'$XV')Strepl¨ER1(mcb sis),i ⍝ Coerce x
     sis←sis EmitPrimitiveFnDefnsTemplateFiller fns
  ⍝ Return generated code &
  ⍝ list of remaining fns to gen
 :EndIf
 r←(E sis),E(~cv)⌿nms
