﻿ r←DupAssigns ast
 ⍝ cv for multiple assigns to same name(s)
 r←ast[;asttarget]
 r←(~r∊NULL)∧(⍳⍴r)≠r⍳r
