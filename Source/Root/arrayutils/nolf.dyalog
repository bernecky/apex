﻿ r←nolf y;b
⍝ delete any LF following a CR. Then replace both by NL
⍝ This is intended to be nilpotent in Linux and
⍝ necessary for Windoze.
 b←¯1⌽y∊CR
 r←(~b∧y∊LF)/y
 r[(r∊CR,LF)/⍳⍴r]←NL
