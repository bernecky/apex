﻿ r←InitializeSemiGlobals cds;st;ast;sg;tar;bin;bout;i;cv;sysv;k
⍝ Initialize semi-globals in each ast
⍝ A semi-global IN is a name ref'd in this fn, but not local to it.
⍝ A semi-global OUT is a name set in this fn, but not local to it.
 ast←D cds[ssaast]
 sg←(0,1↓ast[;astscope]∊stscopeSG)/ast[;asttarget] ⍝ Ignore dfnname
 ⎕←'Original semiglobals for: ',(D ast[0;asttarget]),' are: ',⍕sg
 r←cds
⍝ Now distinguish IN vs OUT.
 i←ast[;asttarget]⍳sg
 tar←ER0 i
 cv←dfainit ast
 bin←tar∊cv⌿ast[;astptrs] ⍝ Semiglobals referenced in this fn
 bout←tar∊cv⌿ast[;asttarget] ⍝ Semiglobals out
 ast[i;astscope]←(bin\astscopeSGI)+bout\astscopeSGO
 ast←SemiGlobalNameSort ast ⍝ This required for leaves only.
⍝ We will re-sort non-leaves later.
 r←cds ⋄ r[ssaast]←E ast
