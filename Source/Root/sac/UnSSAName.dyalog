﻿ r←UnSSAName y;cv
⍝ Remove ssa appendages from name y.
⍝ KLUDGE: We remove trailing numbers preceeded
⍝ by an underbar. Also value errors with "?"
 r←(~⌽∧\⌽y∊'_0123456789?')/y
