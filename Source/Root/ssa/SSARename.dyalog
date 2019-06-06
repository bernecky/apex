﻿ r←SSARename y;i;v;ast;tar;ny;k
 ⍝ From Michael Wolfe , 1992
 ⍝ "High Performance Compliers", p 182
 ⍝ We do renames one at a time, even though
 ⍝ it should be possible to do them in parallel
 ⍝ merge the updates. Lazy, lazy
 ⍝ We only rename variables that have more than
 ⍝ one set in the function.
 v←MultipleAssigns D y[ssaast]
 tar←(×v)/(D y[ssaast])[;asttarget] ⍝ Target names
 v←(×v)/v ⍝ and counts
 ny←y
 :For k :In ⍳⍴v
     i←(D ny[ssaast])[;asttarget]⍳tar[k] ⍝ Find target
     ny←(v[k],i)SSARenameOne ny
     Checkem ny
 :EndFor
 ny←RemoveDeadPhi ny
 ny←RenameResult ny
 Checkem ny
 r←ny
