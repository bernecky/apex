﻿ r←astloprop isDefinedFn ast
⍝# Predicate for defined/derived fn invocations.
⍝ This is mostly used for separating +/⍵ from plus/⍵, and the like
 r←ast[;astloprop]
 r←(isnum r)∧~r∊E NULL
 r←r\(D r⌿ast[;astloprop])<(dfainit ast)⍳1 ⍝ plus/⍵ points to st
