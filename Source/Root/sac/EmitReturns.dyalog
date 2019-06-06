﻿ r←EmitReturns y;ast;cal;i;j
 ⍝# Emit function calls for one user-defined function
 ast←D y[0]
 cal←D y[1]
 j←ast[;astfn]∊E':RI' ⍝ Implicit results don't gen assigns
 cal[j/⍳⍴j;]←E''
 j←ast[;astfn]∊E':RE' ⍝ Explicit result
 j←j/⍳⍴j
 i←Raze⍉squeeze¨cal[j;asttarget],(E,'='),cal[j;calrarg],E';',NL
 cal[j;]←E''
 ⍝ Find formal (explicit) result and implicit results
 ⍝ NB. There is a presumed order to implicit and explicit
 ⍝ results. It happens to be explicit first, but it's
 ⍝ not important as long as caller and callee agree.
 r←j,(ast[;astfn]∊E':RI')/⍳1↑⍴ast ⍝ Implicit results
 r←ast[r;,astrarg] ⍝ Explicit result,semiglobal out names
 r←ast TargetName D r
 r←¯2↓D Raze,r,E',',NL
 r←' return(',r,');'NL
 r←(E r),E cal
