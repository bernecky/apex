﻿ r←ast APLExpn roots;p;fn;ctl;exp
⍝  Build APL expressions rooted at roots
 r←(1↑⍴ast)⍴E''
 cv←~ast[;astfn]∊(E':GI'),(E':GO'),(E':PHI'),(E':RI'),(E':RE')
 cv←cv∧(⍳⍴cv)∊roots
 fn←cv⌿ast[;astfn]
⍝ Assign-like fns
 ctl←DyalogControlStructures,(,'←') ⍝ etc.

 p←cv∧∨/(astlarg,astrarg)APLTemps ast ⍝ Recursively expand temps
 :If 1∊p
     ÷0 ⍝ writeme
     exp←ast APLExpn(∨/p)/⍳1↑⍴ast
 :EndIf
 p←fn∊ctl
 r[(cv\p)/⍳⍴cv]←(p/fn),¨' ',¨ast TargetName(cv\p)⌿ast[;asttarget]
 cv←cv\~p
⍝ Functions
 r[cv/⍳⍴cv]←ast APLFns cv
