﻿ r←SemiGlobalsMarkOut ast;cv
⍝ Mark outgoing semi-globals for this fn
 cv←ast[;astfn]∊E':RI' ⍝ Implicit results
 r←(⍴cv)⍴0
 r[D cv⌿ast[;asttarget]]←1
