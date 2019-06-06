 r←ct SemiGlobalUnRef cds;asts;ast;sgi;cv;i;k;callers;weare;cs;csgi;astr;nums;nms;pv;pl;nl;npl;scp;keep;burn;p;oldcds;tar
⍝ Correct over-enthusiastic definitions of
⍝ semi-globals. The initial definition assumes that
⍝ any variable SG that is referenced as a non-local
⍝ in a sub-function SUBFN is a semi-global input to
⍝ SUBFN. This isn't necessarily true, as in the case
⍝ of:
⍝   ∇r←SUBFN x
⍝  [1] SG←x ⋄ r←SG
⍝   ∇
⍝ The problem is that callers of SUBFN attempt to
⍝ pass SG in as a "semiglobal in". In the case where
⍝ SG is undefined at the calling site, this produces
⍝ illegal SISAL code. Hence, our fix is to determine
⍝ if SG is set before it is referenced in SUBFN.
⍝ If so, we delete SG from the list of SGI in SUBFN,
⍝ and also delete it from the callers list of
⍝ semi-globals to be used in SUBFN calls.
⍝
⍝ This code has a strong assumption about the
⍝ ordering of cds entries from leaf to root.
⍝ Loop over all fns to find unref'd semiglobals
 :Repeat
     oldcds←cds
     :For i :In ⍳⍴cds
  ⍝ Get semi-global inputs to subfn
         asts←D cds[i]
         ast←D asts[ssaast] ⍝ Get subfn's ast
         sgi←ast[;astscope]∊astscopeSGI,astscopeSGO+astscopeSGI
         sgi[dfnname,dfnres,dfnlarg,dfnrarg]←0 ⍝ Ignore fn nm, args,result
         tar←sgi/⍳⍴sgi                ⍝ Potential semiglobals
         p←(~astptrs∊asttag)/astptrs  ⍝ Most, but not all, pointers
         cv←(~ast[;astfn]∊E':RI')⌿ast[;p]
         cv←~tar∊cv                    ⍝ Unreferenced entries
         :If 1∊cv
             scp←2 2⊤ast[(sgi\cv)/⍳⍴sgi;astscope]
             ast[cv/tar;astscope]←2⊥scp∧~2 2⊤(+/cv)⍴astscopeSGI
             'rbe kant kode 'assert∧/(ast[;astscope]≥0)∨ast[;astscope]∊NULL
   ⍝ Have to unSSA names before considering deletion, because
   ⍝ we may not ref ⎕io_2, but DO reference ⎕io_1!
             burn←nub ast[,D ast[cv/tar;asttag];asttarget] ⍝ var to kill in callers
             keep←nub ast[,D ast[(~cv)/tar;asttag];asttarget] ⍝ vars to preserve
             burn←(~burn∊keep)/burn
             asts[ssaast]←E ast ⍝ Insert updated ast for subfn
             cds[i]←E asts
   ⍝ Now remove unref'd stuff from our callers
             weare←(D ct[0])[i] ⍝ Who we are
             callers←nub(∨/sgi)/(D ct[1])[;i]/⍳⍴D ct[0] ⍝ Our callers
             :For j :In callers ⍝ Our callers
                 asts←D cds[j] ⍝ Get caller's cds
                 ast←D asts[ssaast] ⍝ Get caller's ast
                 cs←ast[;asttarget]⍳weare ⍝ Our calling sites
                 cs←ast[;astfn]∊E cs
                 csgi←cs SGIMark ast   ⍝ Mark Semi-globals-In in our caller
                 :If 1∊csgi
     ⍝ Kill :GI entries that are not ref'd by the subfn
     ⍝ NB. Strong assumptions about order and # of entries!
                     astr←csgi⌿ast ⍝ Old :GI entries
                     nums←ast[D ast[D astr[;astrarg];asttag];asttarget]
                     nums←(nums∊burn)/nums ⍝ Kill these entries
                     ast←((E cs),E nums)SGIRemove ast
                     asts[ssaast]←E ast ⍝ Put ast back
                     cds[j]←E asts      ⍝ Put cds back
                 :EndIf
             :EndFor
         :EndIf
     :EndFor
 :Until cds≡oldcds
 r←DeleteNulls¨cds
