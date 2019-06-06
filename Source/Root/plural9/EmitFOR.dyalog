﻿ r←EmitFOR y;ast;i;j;k;itctrs;itctrsz;fns;f;ef;innm;fornm;cv;pf;forin;m;t;n;p;au;tar;forlcv;forz;cal
 ⍝ Emit code for :For loops in Dyalog APL
 ast←D y[0] ⋄ cv←D y[1] ⋄ fns←D y[2] ⋄ cal←D y[3]
 i←ast[;astfn]∊(E':For'),E':EndFor' ⍝ Locate loops
 :If 1∊i ⍝ Any work?
     j←i\(i/ast[;astfn])∊E':For' ⍝ Handle :For
  ⍝ Iteration counter
     itctrs←TempName(E'CTR'),¨⍕¨j/⍳⍴j
     itctrsz←mcb MapNamesSAC itctrs catenateeach'z'
     itctrs←mcb MapNamesSAC itctrs
     innm←mcb ast TargetName ast FindReferent j⌿ast[;astrarg]
     fornm←mcb ast TargetName j⌿ast[;asttarget]
     t←ast EmitFORlcv(E j),(E itctrs),(E innm),(E itctrsz)
     f←D t[0]
     forlcv←D t[1]
     t←ast[;astfn]∊E':PHI' ⍝ No fn calls for :PHI
     cal[t/⍳⍴t;]←E''
     f←f,(E'for(; '),itctrs,(E' <= '),itctrsz
     f←f,(E'; '),itctrs,E'++){',NL
     f←f,fornm,(E' = '),innm,(E'[['),itctrs,E']];',NL
     f←Raze⍉f
     cal[j/⍳⍴j;]←E''
     cal[j/⍳⍴j;caltarget]←f
  ⍝ PHI functions located here are treated as
  ⍝ follows: One of the arguments to the PHI
  ⍝ MUST appear within the loop.
  ⍝ The other argument [there must be only two
  ⍝ of them] is presumed to be the initial value.
  ⍝ end of initializer
  ⍝ Loop body here.
  ⍝ Sets of PHI values within loop are changed to
  ⍝ set the TMP value.
  ⍝ Deal with :EndFor returns clause
     cal[(i≠j)/⍳⍴j;caltarget]←E'}',NL
 :EndIf
 r←(E ast),(E cv),(E fns),E cal
