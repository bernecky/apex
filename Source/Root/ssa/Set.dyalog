﻿ r←vars Set cds;ast;tar;cv;i
⍝# Return vars that this fn sets
 ast←D cds[ssaast]
 tar←(ast[;asttarget]∊vars[;0])/⍳1↑⍴ast
 r←tar∊(dfainit ast)⌿ast[;asttarget]
 i←vars[;0]⍳E'⎕rl' ⍝ Kludge for Roll/Deal ⎕rl semi-global output
 :If i<''⍴⍴vars
     r[i]←(E,'?')∊ast[;astfn]
 :EndIf
 r←r⌿vars[;0]
