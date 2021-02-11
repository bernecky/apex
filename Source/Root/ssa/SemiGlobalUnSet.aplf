 r←ct SemiGlobalUnSet cds;cds;sgi;cv;i;k;callers;weare;cs;csgi;astr;nums;nms;pv;pl;nl;npl;scp;fn;asts
⍝ Remove semi-globals (:RI) that are not set within a fn.
⍝ Percolate any such removals up through calling tree.
⍝ Fundamental idea: If a semi-global is not set w/in a fn AND
⍝ its subfns, we don't need to provide its value at fn exit.
⍝
 :For i :In ⍳⍴cds ⍝ Traverse from leaf to root
     asts←D cds[i]
     ast←D asts[ssaast]                ⍝ Get subfn's ast
     ⍝ Delete dead (not set by us or our sub-fns) :RI entries
     p←ast[;astfn]∊E':RI'
     p←p\~(p/⍳⍴p)∊(~p)⌿ast[;astImplicitResult]   ⍝ Ignore in-use entries
     nms←ast TargetName p⌿ast[;astrarg]
     :If ×⍴nms
         ast[p/⍳⍴p;]←E NULL               ⍝ Delete dead :RI entries
     :EndIf
     ⍝ Correct scope on semi-globals that do not Set.
     sgi←ast[;astscope]∊astscopeSGO,astscopeSGO+astscopeSGI
     sgi[dfnname,dfnlarg,dfnrarg,dfnres]←0 ⍝ Ignore fn name, args, and explicit result
     tar←sgi/⍳⍴sgi                        ⍝ Indices of potential semi-globals
     cv←sgi\~tar∊ast[;asttarget]
     :If 1∊cv
         scp←2 2⊤ast[cv/⍳⍴cv;astscope]
         scp←scp∧~2 2⊤(+/cv)⍴astscopeSGO
         ast[cv/⍳⍴cv;astscope]←2⊥scp
     :EndIf
     asts[ssaast]←E ast ⍝ Insert updated ast for subfn
     cds[i]←E asts
  ⍝ Now remove dead semi-global outs from our callers
     weare←(D ct[0])[i] ⍝ Who we are
     callers←(∨/sgi)/(×D ct[1])[;i]/⍳⍴D ct[0] ⍝ Our callers
     :For j :In callers          ⍝ Our callers
         asts←D cds[j]           ⍝ Get caller's cds
         ast←D asts[ssaast]      ⍝ Get caller's ast
         cs←ast[;asttarget]⍳weare ⍝ Our calling sites
         cs←ast[;astfn]∊E cs
         :If 1∊cs
             ast←((E cs),E nms)SGORemove ast
             asts[ssaast]←E ast
             cds[j]←E asts
         :EndIf
     :EndFor
 :EndFor
 r←csdDeleteNullAstRows¨cds
