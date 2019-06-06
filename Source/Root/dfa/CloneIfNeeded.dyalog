 r←cds CloneIfNeeded y;ast;parm;cv;k;callerfn;calleefn;callername;clr;clt
⍝ Determine if astmerge arguments force a clone to be
⍝ made of a function and, if so, generate the clone fn,
⍝ and correct the calling site.
 ast←D y[0]
 parm←D y[1]
 cv←D y[2]
 callerfn←(D y[3])[0] ⍝ The calling function's cds index
 calleefn←(D y[3])[1] ⍝ The called function's cds index
 ⍝ We do not clone on value differences, because of code
 ⍝ blowup (UTThorn ends up with 169 fns...). 2007-04-19
 ⍝ Hence, dfaUpDown must not propagate known values into subfns.
 ⍝ We clone if types or ranks both exist, but differ.
 ⍝ Old and new types exist, but differ
 clt←(TypeKnown parm)∧TypeKnown cv⌿ast     ⍝ Mark type clones
 clt←clt∧~parm[;asttype]≡¨cv⌿ast[;asttype]
 clr←(RankKnown parm)∧RankKnown cv⌿ast     ⍝ Mark rank clones
 clr←clr∧~parm[;astrank]≡¨cv⌿ast[;astrank]
 r←(E cds),E calleefn
 :If 1∊clr∨clt
     callername←(D(D cds[callerfn])[ssaast])[dfnname;asttarget]
     r←cds CloneFn y
 :EndIf
