 r←ast APLFns roots;cv
⍝# Expand APL fn calls
 cv←~ast[;astlarg]∊NULL ⍝ Left argument present
 r←(⍴roots)⍴E''
 r[cv/⍳⍴cv]←(ast TargetName cv⌿ast[;astlarg]),¨' '
 r[roots/⍳⍴roots]←r[roots/⍳⍴roots],¨ast TargetName roots⌿ast[;astfn]
 r[roots/⍳⍴roots]←r[roots/⍳⍴roots],¨' ',¨ast TargetName roots⌿ast[;astrarg]
 r←roots/r
