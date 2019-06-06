﻿ r←ssadat EmitCut fns;ast;ctl;frag;fn;n;loc;rnk;sis;cv;t;i;j;fns2
 ⍝ Emit code for cut
 sis←''

 :If 0 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝ FIXME ~0∊⍴fns
     ast←D ssadat[ssaast]
     cv←ast[;astfn]∊E,'⍤ ⍝ Mark cuts, ignore rank, compose
     i←(~ast[;astlop]∊NULL)∧isnum ast[;astlop] ⍝ No primitives
  ⍝ Left operand must be numeric constant
     cv←cv∧i\ast[D i/ast[;astlop];astclass]∊astclassNC
     :If 1∊cv ⍝ Any work?
   ⍝ Decorate conj name with type of cut
         fns2←fns
         f←ast[D(cv⌿ast)[;astlop];asttarget]
         fns2[cv/⍳⍴cv;0 1]←f,jsym(cv⌿ast)[;astfn]
   ⍝ We have already trashed the fn name in fns
   ⍝ Make it nuax again, the hard way
         ctl←3 FragmentCode'cut'
         fn←ctl FindFnOnly Raze⍉fns2[;fnslop,fnsfn] ⍝Find conj
         rnk←ctl FindRank fns2 ⍝ Match rank
         n←<⍀rnk∧fn ⍝ Best match
         ....FIXME very Obsolete!
         loc←(⍴n)⊤(,n)/⍳×/⍴n ⍝ Associate frags/fns
         :If ~0∊⍴loc ⍝ Any work?
             sis←ctl[loc[0;];0] ⍝ Ctl frags needed
    ⍝ Name that function
             f←cv⌿ast TargetName ast[;asttarget]
             fns2[cv/⍳⍴cv;0,fnsfn,2]←(E''),f,E'' ⍝ New fn name
             f←D Raze⍉cv⌿fns2[;⍳5]
             sis←(E'$FNAME')Strepl¨ER1(mcb sis),ER1 f
    ⍝ Fix rop args, insert into conj
             f←D cv⌿ast[;astrop]
    ⍝ The call to g generates the fn name if g is
    ⍝ a primitive or defined fn. Otherwise (derived
    ⍝ fn), it generates a TMPxx call.
             i←ast[f;astclass]∊astclassLFN
             j←fns2[f;] ⍝ Primitive, defined rops
             j[i/⍳⍴i;fnslop,fnsrop,fnstypes,fnsranks]←E''
             j[i/⍳⍴i;fnsfn]←(ast TargetName ast[;asttarget,astrop])[i/f;0]
             j←Raze⍉j
             t←(E'$FRVALUE'),(E'$XV,'),E'$YV'
             sis←(E t)DoMacro¨ER1(mcb sis),mcb j
             sis←sis EmitPrimitiveFnDefnsTemplateFiller fns2
             fns←(~cv)⌿fns
         :EndIf
     :EndIf
 :EndIf
 r←(E sis),E fns
