﻿ r←qio EmitFnCallsIndexDirectSet y;i;j;mil;ast;refs;k;sis;m;lhs;rhs;sis2;rnk;I;mt;si
⍝# These are those where all indices are all-scalar or all-NULL
⍝# All-scalar items gen "modarray([i,j,k],X)", with
⍝# suitable error checks on the ⎕io-corrected indices
⍝# All-NULL Items gen assigns
 i←D y[0]
 mil←D y[1]
 ast←D y[2]
 refs←D(E ast)IndexAstLarg¨mil
 k←mil EmitFnCallsIndexDirectOK ast
 si←0=D ast[0⌈refs;astrank]  ⍝ Ops w/all-scalar indices,
⍝                             optionally followed by NULLs
 mt←refs∊NULL,0              ⍝ Empty or non-existent axes
 k←∧/(∧\si)∨(~∧\si)∧mt
 m←k/mil
 refs←,k⌿refs
 si←k⌿si
 I←,D(E ast)TargetName¨m
 mt←k⌿mt
 I[(,mt)/⍳⍴I]←E''
 I←','InsertInterAxisCommas(⍴mt)⍴I
 lhs←mcb ast TargetName ast FindReferent(i\k)⌿ast[;astlarg]
 rnk←ast EmitFnCallsIndexY i\k
 rhs←mcb D rnk[0]
 rnk←D rnk[1]
 sis2←Raze⍉si EmitFnCallsIndexSetElided(E I),(E lhs),(E rhs),E rnk
 sis←Raze⍉si EmitFnCallsIndexSetScalars(E I),(E lhs),E rhs
 m←∨/si
 sis[(~m)/⍳⍴m]←(~m)⌿sis2
 r←(E i\k),E sis
