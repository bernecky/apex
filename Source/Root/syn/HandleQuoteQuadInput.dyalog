﻿ r←HandleQuoteQuadInput ast
⍝ Set ←⍞'s type and rank
 i←ast[;asttarget]⍳E,'⍞'
 r←ast
 →0
 r[i;asttype]←E asttypeC
 r[i;astrank]←E 1
