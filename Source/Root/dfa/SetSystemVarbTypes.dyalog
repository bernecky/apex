﻿ r←SetSystemVarbTypes cds;i;ast;svn;svt;j;nm
 ⍝ Force system varb types to their "real" values
 ast←D cds[ssaast]
⍝ First, do real ⎕vars.
 svn←(E'⎕io'),(E'⎕pp'),(E'⎕pw'),(E'⎕rl'),(E'⎕ct')
 svt←E¨(4⍴asttypeI),asttypeD
 i←ast[;asttarget]⍳svn
 ast[i;asttype]←svt
 ast[i;astrank]←ER0 0 0 0 0 0
 ast[i;astshape]←(5⍴E 0⍴0)
⍝ Now, do SSA system vars
⍝ Kludge because all the names just happen to be
⍝ the same length...
 j←⍴D''⍴svn
 nm←j↑¨ast[;asttarget] ⍝ Names sans SSA suffixes
 i←nm∊svn
 i←i/⍳⍴i
 j←nm[i]∊E'⎕ct'        ⍝ ⎕ct is the only Double
 ast[i;asttype]←(E¨asttypeI,asttypeD)[j]
 ast[i;astrank]←E 0
 ast[i;astshape]←E 0⍴0
 r←cds ⋄ r[ssaast]←E ast
