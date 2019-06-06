﻿ r←APLBody ast;cv;nms;roots;fn;temps
⍝# Build APL function body from ast
 cv←(dfainit ast)∧~ast[;asttarget]∊NULL
 temps←asttarget APLTemps ast ⍝ Temp assigns
 r←(1↑⍴ast)⍴E''
 roots←cv∧~temps
 r[roots/⍳⍴roots]←ast TargetName roots⌿ast[;asttarget]
⍝
 fn←ast APLExpn roots⌿ast[;astfn] ⍝ Build expression body
 .
 p←APLMarkPrimitive ast ⍝ Mark simple primitives
 r[(cv∧p)/⍳⍴p]←(cv∧p)APLFormatPrimitive ast
 cv←cv∧~p               ⍝ Done w/simple primitives
 .
 r←mm ast TargetName cv⌿ast[;asttarget] ⍝ Root var names
 r/
 k←(cv⌿ast[;astfn])∊(E'←'),E':GO' ⍝ Straight assigns
 r[k/⍳⍴k]←r[k/⍳⍴k],¨ast TargetName...
 /
